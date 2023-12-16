import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarot Card Fortune',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TarotCardScreen(),
    );
  }
}

class TarotCardScreen extends StatefulWidget {
  @override
  _TarotCardScreenState createState() => _TarotCardScreenState();
}

class _TarotCardScreenState extends State<TarotCardScreen> {
  int? tarotCardNumber;
  final random = Random();

  final Map<int, String> tarotCardDescriptions = {
    1: "THE FOOL\n\n결정이 앞에 놓여있어요.\n새로운 모험을 하게 될 수도?",
    2: "THE MAGICIAN\n\n가까운 미래에 더 바빠질 수 있어요.\n수입이 늘어날지도!",
    3: "THE HIGH PRIESTESS\n\n내면의 목소리에 귀를 기울여보세요.\n비밀이 밝혀질 수 있어요.",
    4: "THE EMPRESS\n\n창조력과 풍요로움이 넘치는 시기예요.\n주변의 사랑을 느낄 수 있어요.",
    5: "THE EMPEROR\n\n안정과 권위가 필요한 시기예요.\n계획을 세워 실천해보세요.",
    6: "THE HIEROPHANT\n\n전통과 교육이 중요해질 거예요.\n지식을 공유할 시기예요.",
    7: "THE LOVERS\n\n중요한 관계의 선택이 다가와요.\n사랑과 조화를 추구해보세요.",
    8: "THE CHARIOT\n\n진취적인 태도로 목표를 향해 나아가야 할 때예요.\n결단력이 중요해요.",
    9: "STRENGTH\n\n내면의 힘과 용기를 발휘할 시기예요.\n감정을 조절하는 것이 중요해요.",
    10: "THE HERMIT\n\n혼자만의 시간을 갖고 사색하는 것이 좋아요.\n내면의 목소리를 들어보세요.",
    11: "WHEEL OF FORTUNE\n\n변화의 시기가 오고 있어요.\n기회는 준비된 자에게 온다는 걸 기억하세요.",
    12: "JUSTICE\n\n공정함과 균형이 중요한 시기예요.\n중요한 결정을 내릴 때가 왔어요.",
    13: "THE HANGED MAN\n\n생각의 전환을 시도해보세요.\n새로운 관점이 필요한 때예요.",
    14: "DEATH\n\n종말이 아닌 새로운 시작을 의미해요.\n변화를 두려워하지 마세요.",
    15: "TEMPERANCE\n\n인내와 조화가 중요해요.\n균형 잡힌 접근을 시도해보세요.",
    16: "THE DEVIL\n\n유혹이나 중독에서 벗어날 시기예요.\n자유를 위한 싸움이 필요해요.",
    17: "THE TOWER\n\n갑작스러운 변화나 혁신이 일어날 수 있어요.\n유연하게 대처하는 것이 중요해요.",
    18: "THE STAR\n\n희망과 영감이 가득한 시기예요.\n빛나는 미래를 기대해도 좋아요.",
    19: "THE MOON\n\n혼란스러운 감정이나 환상에 주의해야 해요.\n현실을 직시하는 것이 중요해요.",
    20: "THE SUN\n\n성공과 활력의 시기예요.\n모든 것이 잘 풀릴 거예요.",
    21: "JUDGEMENT\n\n재생과 부활의 시기예요.\n과거를 뒤돌아보고 앞으로 나아가세요.",
    22: "THE WORLD\n\n완성과 성취의 시기예요.\n큰 목표를 이룰 수 있어요."
  };


  void pickCard() {
    setState(() {
      tarotCardNumber = random.nextInt(22) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // 여기서 AppBar의 높이를 조절할 수 있습니다
        child: Padding(
          padding: EdgeInsets.only(top: 30.0), // AppBar의 상단 패딩 조정
          child: AppBar(
            title: Text(
              '🔮 Tarot Card Fortune 🔮',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (tarotCardNumber != null)
              Image.asset('assets/tarot_cards/card_$tarotCardNumber.jpg'),
            SizedBox(height: 20),
            if (tarotCardNumber != null)
              Text(
                tarotCardDescriptions[tarotCardNumber] ?? 'No Description',
                textAlign: TextAlign.center,  // 여기에 텍스트 중앙 정렬을 추가합니다.
                style: TextStyle(
                  // 필요한 경우 추가 스타일링을 여기에 추가할 수 있습니다.
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickCard,
              child: Text('운세 카드 뽑기'),
            ),
          ],
        )
      ),
    );
  }
}
