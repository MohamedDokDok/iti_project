import 'package:flutter/material.dart';

class TipsScreenTap2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => tipItemBuilder(index),
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemCount: tips.length)
    );
  }


  List<String> tips = [
    'لم يتحسر أهل القبور على شيء كما تحسروا على ساعة فاتتهم في الدنيا لم يذكروا الله فيها.',
    'لا تكفوا عن الدعاء؛ فالله يعطي دون انتهاء.',
    'إذا أحب الله عبداً اصطنعه لنفسه: فشغل همه به، ولسانه بذكره، وجوارحه بخدمته.',
    'أرق القلوب قلب يخشى الله، وأعذب الكلام ذكر الله، وأطهر حب الحب في الله.',
    'حافظي على حجابك، وتمسكي به، ولا تخرجي من بيتك إلا متحجبة، واطلبي الستر من الله دائماً، واشكريه على أن منّ عليكِ وجعلكِ من زمرة اللاتي أكرمهن الله بالحجاب، وَصانهن فَأراد تَزكيتهن.',
    'حافظ على أداء السنن الرواتب.',
    'تجنب عقوق الوالدين، فإنهما أحق الناس بصحبتك، وإذا غضب أحدهم منك فلا تهدأ حتى تسترضيه، وقدم أمك في البر والإكرام والصلة، وإياك أن تغضبها فقد أوصى النبي صلى الله عليه وسلم بها ثلاثاً.',
    'أدعو إلى الله بكل ما تملك ومن ذلك أن تكون قدوة حسنة بحيث تعكس قيم الدين أمام الناس.',
    'احرص على قراءة القرآن الكريم يومياً، وتمعن في آياته.',
    'احرص على غض بصرك، وتجنب الوقوع في كبائر الذنوب، وصغائرها.',
    'أخلص النية لله في جميع أعمالك سواء الأعمال الدنيوية أو الأخروية.',
    'تحلى بالصبر عند الابتلاء، وأكثر من الصلاة على النبي؛ فإن بها تنفك العقد، وتتفرج الكرب.',
    'احرص على أداء الصلاة اليومية في وقتها؛ لأن الصلاة من أعظم الأركان في الإسلام؛ فإذا قام بها الإنسان صلحت جميع أعماله، وإن لم يقم بها فسدت جميع أعماله.',
  ];

  Widget tipItemBuilder(index) => Card(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        tips[index],
        style: const TextStyle(
          fontSize: 16.0,
          fontStyle: FontStyle.italic,
        ),
        textDirection: TextDirection.rtl,
      ),
    ),
  );
}
