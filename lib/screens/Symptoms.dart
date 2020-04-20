import 'package:covid19/Constants.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identify the disease'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            symptomsContainer(
                iconName: 'fever',
                symptomName: 'Fever',
                symptomDescription:
                    "When your body temperature rises because of an infection, it's called a fever. Fevers are caused by chemicals called pyrogens flowing in the bloodstream. One purpose of a fever is thought to be to raise the body's temperature enough to kill off certain bacteria and viruses sensitive to temperature changes."),
            symptomsContainer(
                iconName: 'tiredness',
                symptomName: 'Tiredness',
                symptomDescription:
                    "A feeling of a lessened capacity for work and reduced efficiency of accomplishment, usually accompanied by a sense of weariness and fatigue. Tiredness is not a singular symptom that defines any one particular disease. Rather, tiredness can be a symptom of many different diseases and conditions. The lack of energy associated with tiredness can sometimes cause difficulty with normal daily activities, leading to problems with attentiveness and concentration."),
            symptomsContainer(
                iconName: 'cough',
                symptomName: 'Dry Cough',
                symptomDescription:
                    "While people can generally cough voluntarily, a true cough is usually a reflex triggered when an irritant stimulates one or more of the cough receptors found at different points in the respiratory system. These receptors then send a message to the cough center in the brain, which in turn tells the body to cough. A cough begins with a deep breath in, at which point the opening between the vocal cords at the upper part of the larynx (glottis) shuts, trapping the air in the lungs."),
            symptomsContainer(
                iconName: 'pain',
                symptomName: 'Aches & Pains',
                symptomDescription:
                    "Body aches are a common symptom of many conditions. The flu is one of the most well-known conditions that can cause body aches. Aches can also be caused by your everyday life, especially if you stand, walk, or exercise for long periods of time. "),
            symptomsContainer(
                iconName: 'nasalcongestion',
                symptomName: 'Nasal Congestion',
                symptomDescription:
                    "Nasal congestion is the blockage of the nasal passages usually due to membranes lining the nose becoming swollen from inflamed blood vessels. Nasal decongestants target the discomfort directly. Nasal congestion can interfere with hearing and speech."),
            symptomsContainer(
                iconName: 'runnynose',
                symptomName: 'Runny Nose',
                symptomDescription:
                    "A runny nose is excess nasal drainage. It may be a thin clear fluid, thick mucus or something in between. The drainage may run out of your nose, down the back of your throat or both. The terms 'rhinorrhea' and 'rhinitis' are often used to refer to a runny nose."),
            symptomsContainer(
                iconName: 'sorethroat',
                symptomName: 'Sore Throat',
                symptomDescription:
                    "A sore throat is pain, scratchiness or irritation of the throat that often worsens when you swallow. The most common cause of a sore throat (pharyngitis) is a viral infection, such as a cold or the flu. A sore throat caused by a virus resolves on its own."),
            symptomsContainer(
                iconName: 'diarrhoea',
                symptomName: 'Diarrhoea',
                symptomDescription:
                    "Diarrhoea, is the condition of having at least three loose, liquid, or watery bowel movements each day. It often lasts for a few days and can result in dehydration due to fluid loss. Signs of dehydration often begin with loss of the normal stretchiness of the skin and irritable behaviour."),
          ],
        ),
      ),
    );
  }

  symptomsContainer(
      {String iconName, String symptomName, String symptomDescription}) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            children: [
              Image(
                image: AssetImage('assets/icon/$iconName.png'),
                height: 64,
                width: 64,
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    symptomName,
                    style: kSymptomNameTextStyle,
                  ),
                  Text(
                    symptomDescription,
                    style: kSymptomDescriptionTextStyle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
