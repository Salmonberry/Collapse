import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidgetPanel extends StatefulWidget {
  const TextWidgetPanel({Key? key}) : super(key: key);

  @override
  State<TextWidgetPanel> createState() => _TextWidgetPanelState();
}

class _TextWidgetPanelState extends State<TextWidgetPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          children: [
            _buildTextWidgetWithAutoWrap(),
            const SizedBox(height: 10),
            _buildTextWidgetWithAutoWrapAndEllipsis()],
        ),
      ),
    );
  }

  Widget _buildTextWidgetWithAutoWrap() {
    // 定义一个Text（）能换行，需要具备如下条件：
    // 包裹Text的上层父级是有具体的大小，即长宽
    // Text需要设置自动换行属性：softWrap:true
    return const SizedBox(
      width: 400,
      height: 200,
      child: Text(
        '《刀劍神域》原本是川原礫為了參加2002年電擊遊戲小說大獎而撰寫的長篇小說，但由於文章過長而無法參加，之後改為在網路上以「九里史生」名義連載。連載的時間是2002年11月－2008年7月，2004年開始受到大量關注，2005年開始連載最長的故事「Alicization篇」。在為了轉換心情而寫的《加速世界》獲得第15回電擊小說大獎大賞後，讀過本作的責任編輯三木一馬就提議將本作在電擊文庫正式出版[註 2]。文庫版本是將網路版本的內容加以潤色或重寫而成。[註 3]在決定出版後，作者將網站上本系列已連載結束的章節刪除，並在網站上發佈「通知」[4]，將出版經過告知讀者。在將原先網路版在電擊文庫出版完成之後，川原礫繼續創作了後續全新的的Unital Ring篇章。',
        softWrap: true,
      ),
    );
  }

  Widget _buildTextWidgetWithAutoWrapAndEllipsis() {
    // 定义一个Text（）能换行且带有省略号，需要具备如下条件：
    // 包裹Text的上层父级是有具体的大小，即长宽
    // Text需要设置最大的换行数和超出换行数显示为省略号：
    // maxLines：[maxLine]
    // overflow: TextOverflow.ellipsis
    return const SizedBox(
      width: 400,
      height: 200,
      child: Text(
        '《刀劍神域》原本是川原礫為了參加2002年電擊遊戲小說大獎而撰寫的長篇小說，但由於文章過長而無法參加，之後改為在網路上以「九里史生」名義連載。連載的時間是2002年11月－2008年7月，2004年開始受到大量關注，2005年開始連載最長的故事「Alicization篇」。在為了轉換心情而寫的《加速世界》獲得第15回電擊小說大獎大賞後，讀過本作的責任編輯三木一馬就提議將本作在電擊文庫正式出版[註 2]。文庫版本是將網路版本的內容加以潤色或重寫而成。[註 3]在決定出版後，作者將網站上本系列已連載結束的章節刪除，並在網站上發佈「通知」[4]，將出版經過告知讀者。在將原先網路版在電擊文庫出版完成之後，川原礫繼續創作了後續全新的的Unital Ring篇章。',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
