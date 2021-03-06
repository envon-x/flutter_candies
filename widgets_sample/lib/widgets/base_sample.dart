import 'package:flutter/material.dart';
import 'package:widgets_sample/WidgetNames.dart';
import 'package:widgets_sample/main.dart';
import 'package:widgets_sample/widgets/Icon_sample.dart';
import 'package:widgets_sample/widgets/Image_sample.dart';
import 'package:widgets_sample/widgets/button_sample.dart';
import 'package:widgets_sample/widgets/container_sample.dart';
import 'package:widgets_sample/widgets/row_column_sample.dart';
import 'package:widgets_sample/widgets/text_sample.dart';

class BaseSample extends StatefulWidget {
  WidgetNames widgetName;
  BaseSample(WidgetNames widgetName) {
    this.widgetName = widgetName;
  }
  @override
  State<StatefulWidget> createState() => new BaseSampleState(widgetName);
}

class BaseSampleState extends State<BaseSample> {
  WidgetNames widgetName;
  String title;
  BaseSampleState(WidgetNames widgetName) {
    this.widgetName = widgetName;
    title = widgetName.toString().replaceAll("WidgetNames.", "");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text('$title sample')),
      body: getBody(context),
    );
  }

  SampleBody sb = null;
  Widget getBody(BuildContext context) {
    if (sb == null) {
      switch (widgetName) {
        case WidgetNames.Container:
          sb = new ContainerSampleBody();
          break;
        case WidgetNames.RowColumn:
          sb = new RowColumnSampleBody();
          break;
        case WidgetNames.Image:
          sb = new ImageSampleBody();
          break;
        case WidgetNames.Text:
          sb = new TextSampleBody();
          break;
        case WidgetNames.Icon:
          sb = new IconSampleBody();
          break;
        case WidgetNames.Button:
          sb = new ButtonSampleBody();
          break;
      }
    }

    sb.State = this;
    return sb.getBody(context);
  }
}

abstract class SampleBody {
  BaseSampleState State;
  @protected
  Widget getBody(BuildContext context);

  void setState(Function f) {
    State.setState(f);
  }
}
