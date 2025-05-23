import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tensorflow/main.dart';
import 'package:tensorflow/pose_estimation/helper/pose_estimation_helper.dart';
import 'package:tensorflow/pose_estimation/models/person.dart';
import 'models/body_part.dart';

class PoseEstimationApp extends StatefulWidget {
  const PoseEstimationApp({super.key, required this.title});

  final String title;

  @override
  State<PoseEstimationApp> createState() => _PoseEstimationAppState();
}

class _PoseEstimationAppState extends State<PoseEstimationApp> with WidgetsBindingObserver {
  CameraController? _cameraController;
  bool _isProcessing = false;
  Person? _person;
  late PoseEstimationHelper _poseEstimationHelper;
  late CameraDescription _cameraDescription;

  // init camera
  _initCamera() {
    _cameraDescription = cameras.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back);
    _cameraController = CameraController(
        _cameraDescription, ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: Platform.isIOS
            ? ImageFormatGroup.bgra8888
            : ImageFormatGroup.yuv420);
    _cameraController!.initialize().then((value) {
      _cameraController!.startImageStream(_imageAnalysis);
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _imageAnalysis(CameraImage cameraImage) async {
    // if image is still analyze, skip this frame
    if (_isProcessing) {
      return;
    }
    _isProcessing = true;
    final persons = await _poseEstimationHelper.estimatePoses(cameraImage);
    _isProcessing = false;
    if (mounted) {
      setState(() {
        _person = persons;
      });
    }
  }

  // this function using config camera and init model
  _initHelper() async {
    _initCamera();
    _poseEstimationHelper = PoseEstimationHelper();
    await _poseEstimationHelper.initHelper();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initHelper();
    });
  }

  // handle app lifecycle state change (pause/resume)
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        _cameraController?.stopImageStream();
        break;
      case AppLifecycleState.resumed:
        if (_cameraController != null &&
            !_cameraController!.value.isStreamingImages) {
          await _cameraController!.startImageStream(_imageAnalysis);
        }
        break;
      default:
    }
  }

  // dispose camera
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    _poseEstimationHelper.close();
    super.dispose();
  }

  // camera widget to display camera preview and person
  Widget resultWidget(context) {
    if (_cameraController == null) return Container();

    final scale = MediaQuery.of(context).size.width /
        _cameraController!.value.previewSize!.height;

    return Stack(
      children: [
        CameraPreview(_cameraController!),
        _person != null
            ? CustomPaint(
                painter: OverlayView(scale: scale)..updatePerson(_person!),
              )
            : Container(),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  'Model: PoseNet',
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Score: ${_person?.score.toStringAsFixed(2) ?? 0.00}',
                  textAlign: TextAlign.left,
                ),
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset('assets/images/tfl_logo.png'),
        ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: resultWidget(context),
    );
  }
}

class OverlayView extends CustomPainter {
  OverlayView({required double scale}) : _scale = scale;
  static const _minConfidence = 0.2;
  static const _bodyJoints = [
    [BodyPart.nose, BodyPart.leftEye],
    [BodyPart.nose, BodyPart.rightEye],
    [BodyPart.leftEye, BodyPart.leftEar],
    [BodyPart.rightEye, BodyPart.rightEar],
    [BodyPart.nose, BodyPart.leftShoulder],
    [BodyPart.nose, BodyPart.rightShoulder],
    [BodyPart.leftShoulder, BodyPart.leftElbow],
    [BodyPart.leftElbow, BodyPart.leftWrist],
    [BodyPart.rightShoulder, BodyPart.rightElbow],
    [BodyPart.rightElbow, BodyPart.rightWrist],
    [BodyPart.leftShoulder, BodyPart.rightShoulder],
    [BodyPart.leftShoulder, BodyPart.leftHip],
    [BodyPart.rightShoulder, BodyPart.rightHip],
    [BodyPart.leftHip, BodyPart.rightHip],
    [BodyPart.leftHip, BodyPart.leftKnee],
    [BodyPart.leftKnee, BodyPart.leftAnkle],
    [BodyPart.rightHip, BodyPart.rightKnee],
    [BodyPart.rightKnee, BodyPart.rightAnkle]
  ];
  final double _scale;
  Person? _persons;

  final Paint _strokePaint = Paint()
    ..color = Colors.red
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke;

  final Paint _circlePaint = Paint()
    ..color = Colors.red
    ..strokeWidth = 3
    ..style = PaintingStyle.fill;

  updatePerson(Person persons) {
    _persons = persons;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_persons == null) return;
    // draw circles
    if (_persons!.score > _minConfidence) {
      _persons?.keyPoints.forEach((element) {
        canvas.drawCircle(
            Offset(
                element.coordinate.dx * _scale, element.coordinate.dy * _scale),
            5,
            _circlePaint);
      });
      for (var index in _bodyJoints) {
        final pointA = _persons?.keyPoints[index[0].index].coordinate;
        final pointB = _persons?.keyPoints[index[1].index].coordinate;
        // drawLine
        if (pointA != null && pointB != null) {
          canvas.drawLine(Offset(pointA.dx * _scale, pointA.dy * _scale),
              Offset(pointB.dx * _scale, pointB.dy * _scale), _strokePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant OverlayView oldDelegate) {
    return oldDelegate._persons != _persons;
  }
}