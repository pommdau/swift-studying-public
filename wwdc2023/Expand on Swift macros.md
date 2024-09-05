# [Expand on Swift macros](https://developer.apple.com/videos/play/wwdc2023/10167)

![](https://i.imgur.com/CoKs1UH.jpeg)

- Swiftコンパイラを変更することなく、独自でビルド時にカスタムコードを作成できる機能である

# ![](https://i.imgur.com/iwADY5g.jpeg)
![](https://i.imgur.com/6nBZvUD.jpeg)

![](https://i.imgur.com/M9xLZNl.jpeg)

![](https://i.imgur.com/IkaRNP8.jpeg)

![](https://i.imgur.com/wT4mPYB.jpeg)

![](https://i.imgur.com/EI6AIn3.jpeg)

- Errorの書き方

![](https://i.imgur.com/ZdqPjrc.jpeg)

![](https://i.imgur.com/q0muz8B.jpeg)

- Macro以外では対応できない場合…Macroの出番だ

![](https://i.imgur.com/uKvMlPB.jpeg)
 
![](https://i.imgur.com/YKXeveA.jpeg)

- completion -> asyncのメソッドを簡単に提供したい

![](https://i.imgur.com/QWisqHH.jpeg)

![](https://i.imgur.com/LszYuih.jpeg)

![](https://i.imgur.com/DoV73nS.jpeg)

![](https://i.imgur.com/Wcq7U12.jpeg)

![](https://i.imgur.com/Pan0lGF.jpeg)

![](https://i.imgur.com/g7BIiDn.jpeg)

![](https://i.imgur.com/SWaRuZq.jpeg)

![](https://i.imgur.com/OluEzzz.jpeg)

![](https://i.imgur.com/MqZUDBw.jpeg)

![](https://i.imgur.com/Jap0ijx.jpeg)

- 複数rolesをつけられる

![](https://i.imgur.com/RzV9P4L.jpeg)

![](https://i.imgur.com/ZrWOuUM.jpeg)

![](https://i.imgur.com/NwgQiTi.jpeg)

![](https://i.imgur.com/QErDMJU.jpeg)

- Macroはそれぞれロジックが独立しているので順番を気にする必要必要ない

![](https://i.imgur.com/Ji3XipR.jpeg)

![](https://i.imgur.com/l69cZdZ.jpeg)

![](https://i.imgur.com/wWf7InF.jpeg)

![](https://i.imgur.com/P1b7fRu.jpeg)

![](https://i.imgur.com/gERcvwP.jpeg)

- これまでのをまとめると…

![](https://i.imgur.com/COE3Llf.jpeg)

![](https://i.imgur.com/kO9WpDM.jpeg)

![](https://i.imgur.com/SYUI4gV.jpeg)

![](https://i.imgur.com/QJy0geS.jpeg)

![](https://i.imgur.com/WLVNfzj.jpeg)

![](https://i.imgur.com/e2F3CAk.jpeg)

![](https://i.imgur.com/JdXCxOt.jpeg)

![](https://i.imgur.com/AMsPoxy.jpeg)

![](https://i.imgur.com/bOQQLhz.jpeg)

![](https://i.imgur.com/C60Zzc2.jpeg)

![](https://i.imgur.com/cpWbBqh.jpeg)

- 詳しくは以下のビデオかSwift Syntaxのドキュメントを参照

![](https://i.imgur.com/miatlXg.jpeg)

![](https://i.imgur.com/sl9giJP.jpeg)

![](https://i.imgur.com/eWnr4Pt.jpeg)

![](https://i.imgur.com/TUlfI6s.jpeg)

![](https://i.imgur.com/EGQXnK6.jpeg)

![](https://i.imgur.com/KHAA7co.jpeg)

![](https://i.imgur.com/exE4Mde.jpeg)

![](https://i.imgur.com/FIbyhD5.jpeg)

![](https://i.imgur.com/hhFC5OF.jpeg)

![](https://i.imgur.com/ZQ3OT5l.jpeg)

- context: エラーや警告の発生などができる

![](https://i.imgur.com/1jeqbdv.jpeg)

![](https://i.imgur.com/JgEe5TJ.jpeg)

![](https://i.imgur.com/nsE9jWN.jpeg)

![](https://i.imgur.com/lLZsDqJ.jpeg)

- より細かくエラーを制御する方法

![](https://i.imgur.com/QCZ0bOZ.jpeg)

![](https://i.imgur.com/uB23GV5.jpeg)

![](https://i.imgur.com/EQFwnZe.jpeg)

![](https://i.imgur.com/nyhRLIh.jpeg)

![](https://i.imgur.com/IuoDgtW.jpeg)

![](https://i.imgur.com/grzNShk.jpeg)

![](https://i.imgur.com/Sha9J4o.jpeg)

![](https://i.imgur.com/HiRE4Yt.jpeg)

- さらにFixを提供したりハイライトしたりノートを参照したり、利用ユーザに便利な機能が提供できる。

![](https://i.imgur.com/JqvnOGe.jpeg)

![](https://i.imgur.com/rxADx7W.jpeg)

![](https://i.imgur.com/rT0Eq6t.jpeg)

![](https://i.imgur.com/vL31eC4.jpeg)

- 単純な文字列は事故防止の為渡せない(下記でも渡しているのは`ExprSyntax`である)

![](https://i.imgur.com/21GaaYh.jpeg)

![](https://i.imgur.com/6kXnmZJ.jpeg)

- `literal: `で始まる特殊な補完を使用し、文字列リテラルとして挿入する

![](https://i.imgur.com/AuEsPKE.jpeg)

![](https://i.imgur.com/g2CTCry.jpeg)

![](https://i.imgur.com/6pvCSfr.jpeg)

![](https://i.imgur.com/gCNhL5X.jpeg)

![](https://i.imgur.com/2EwRPno.jpeg)

![](https://i.imgur.com/UsCLb7K.jpeg)

![](https://i.imgur.com/ZZcDGjR.jpeg)

![](https://i.imgur.com/djjLiYx.jpeg)

![](https://i.imgur.com/jxcKkuG.jpeg)

![](https://i.imgur.com/nRdwvRu.jpeg)

![](https://i.imgur.com/4JE8UlT.jpeg)

![](https://i.imgur.com/mm9R0Qr.jpeg)

- 日時など外部情報はSwift Macrosでは使わないこと

![](https://i.imgur.com/zUcVS6u.jpeg)

![](https://i.imgur.com/lFga0gM.jpeg)

![](https://i.imgur.com/YMvm6Ab.jpeg)

![](https://i.imgur.com/8q68G6V.jpeg)
