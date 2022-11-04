import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';
enum GenderDetect { male, female }

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolour = kInactiveCardColor;
  Color femalecardcolour = kInactiveCardColor;
  GenderDetect? gender;
  int height = 180;
  int weight = 60;
  int age = 18;
  // void UpadateColor( gender){
  //   //1==male
  //   if(gender==GenderDetect.male){
  //     if(malecardcolour==inactiveCardColor){
  //         malecardcolour=ActiveCardColor;
  //         femalecardcolour=inactiveCardColor;
  //     }
  //     else{
  //       malecardcolour=inactiveCardColor;
  //     }
  //   }
  //   //2==female
  //   if(gender==GenderDetect.female){
  //     if(femalecardcolour==inactiveCardColor){
  //         femalecardcolour=ActiveCardColor;
  //         malecardcolour=inactiveCardColor;
  //     }
  //     else{
  //       femalecardcolour=inactiveCardColor;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    onPress: () {
                      setState(() {
                        gender = GenderDetect.male;
                      });
                    },
                    colour: gender == GenderDetect.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CustomIconContent(
                        icon: FontAwesomeIcons.mars, string: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    onPress: () {
                      setState(() {
                        gender = GenderDetect.female;
                      });
                    },
                    cardChild: CustomIconContent(
                        icon: FontAwesomeIcons.venus, string: 'FEMALE'),
                    colour: gender == GenderDetect.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kfontTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xffeb1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x15eb1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 13),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //activeColor: Colors.white,
                      inactiveColor: Color(0xff8D8e98),
                      onChanged: (double nextvalue) {
                        setState(() {
                          height = nextvalue.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kfontTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kfontTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            string: 'CALCULATE',
            onpressed: () {

              CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.CalculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onpressed});
  final IconData? icon;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 10,
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: MediaQuery.of(context).size.height*0.3,
        width: 56,
      ),
    );
  }
}
