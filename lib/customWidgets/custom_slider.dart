import 'package:sahash/constants/constants.dart';
import 'package:sahash/customWidgets/gradient_rect_slider_track_shape.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final Function(double) sliderValueChangeHandler;

  final double defaultValue;
  // ignore: use_key_in_widget_constructors
  const CustomSlider(this.defaultValue, this.sliderValueChangeHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: getLeftPadding(defaultValue)),
                  child: Container(
                    padding: const EdgeInsets.all(07.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Text(defaultValue.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.thumb_down,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: SliderTheme(
                    data: const SliderThemeData(
                      showValueIndicator: ShowValueIndicator.always,
                      trackShape: GradientRectSliderTrackShape(
                          gradient: gradient, darkenInactive: true),
                      thumbColor: Colors.green,
                      trackHeight: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Slider(
                          value: defaultValue,
                          min: 1.0,
                          max: 5.0,
                          onChanged: (dynamic value) {
                            sliderValueChangeHandler(value);
                          },
                          divisions: 4,
                          label: defaultValue.round().toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.thumb_up,
                    color: Colors.black,
                    size: 20.0,
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 75),
              child: Text('1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 205),
              child: Text('5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  )),
            ),
          ],
        ),
      ],
    );
  }

//todo - make this dynamic value
  double getLeftPadding(double currentSliderValue) {
    if (currentSliderValue == 1) {
      return 65;
    } else if (currentSliderValue == 2) {
      return 125;
    } else if (currentSliderValue == 3) {
      return 170;
    } else if (currentSliderValue == 4) {
      return 220;
    } else {
      return 270;
    }
  }
}
