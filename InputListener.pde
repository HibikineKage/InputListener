///////////////////////////////////////////
//  ___                   _              //
// |_ _|_ __  _ __  _   _| |_            //
//  | || '_ \| '_ \| | | | __|           //
//  | || | | | |_) | |_| | |_            //
// |___|_|_|_| .__/ \__,_|\__|           //
// | |   (_)_|_| |_ ___ _ __   ___ _ __  //
// | |   | / __| __/ _ \ '_ \ / _ \ '__| //
// | |___| \__ \ ||  __/ | | |  __/ |    //
// |_____|_|___/\__\___|_| |_|\___|_|    //
//                                       //
//   08/May/2016 ver.0.2                 //
//            Created By Hibikine Kage   //
//                                       //
///////////////////////////////////////////
//
//
// Processing用入力ラッパーです。
// クソみたいな入力受け取りを多少マシにします。
//
//
//   +++使い方+++
//
// 新規タブにInputListerとか適当に名前を付けて、
// 中身をコピペしてください。
// 仕様上、keyPressed(), keyReleased(), 
// mousePressed(), mouseReleased()は使えません。
//
//
//   +++Enum+++
//
// Key
//  キーごとに対応したキー入力受け取り用Enumです。
//
// get()
//  キーの入力状況を取得します。
//  キーが押されているならばtrueを返します。
//  例) if(Key.a.get()){ ... }
//      aキーが押されているならば...する
//
//  例) if(Key.space.get()){ ... }
//      スペースキーが押されているならば...する
//
//  例) if(Key.n3.get()){ ... }
//      3キーが押されているならば...する
//
//  使えるキーは以下の通りです。
//   backspace(\b), tab(\t), enter(\n), shift, ctrl, alt,
//   escape, space( ), left(←), up(↑), right(→), down(↓),
//   comma(,), hyphen(-), period(.), slash(/),
//   n0～n9(0～9), a～z(a～z),
//   bracketOpen([), backslash(\), bracketClose(]),
//   f1～f12(F1～F12), delete(Del), numlk(NumLK), insert(Insert),
//   at(@), colon(:), caret(^)
//
// id
//  キーコードを取得します。
//  例) int attack_key = Key.a.id;
//      aキーのキーコードを取得して代入する。
//
// key
//  キー1文字を取得します。
//  例) char attack_key = Key.a.id;
//      aキーの文字を取得して代入する。
//
//
//
//
//
// Mouse
//  マウスボタンごとに対応したマウスボタン入力受け取り用Enumです。
//
// get()
//  マウスの入力状況を取得します。
//  マウスが押されているならばtrueを返します。
//  例) if(Mouse.r.get()){ ... }
//      右ボタンが押されているならば...する
//
//  例) if(Key.l.get()){ ... }
//      左ボタンが押されているならば...する
//
//  例) if(Key.c.get()){ ... }
//      中ボタンが押されているならば...する
//
//  使えるキーは以下の通りです。
//   c(中クリック), r(右クリック), l(左クリック)
//
// id
//  マウスのボタンIDを取得します。
//  例) int rightId = Mouse.r.id;
//      右クリックのボタンID(37)を取得する。
//
//
//   +++定数+++
//
// keyCodeToEnum[keyCode]
//  keyCodeに応じたKeyのEnumを返します。
//  例) if(keyCodeToEnum[65].get()){ ... }
//      キーコード65番(Aキー)が押されている時、カッコ内を実行します。
//
//
// mouseToEnum[mouseButton]
//  mouseButtonに応じたMouseのEnumを返します。
//  例) if(mouseToEnum[3].get()){ ... }
//      マウスボタン3番(中クリック)が押されている時、
//      カッコ内を実行します。
//
//
//   +++変数+++
//
// int pressedKeyNum
//  押されているキーの個数を取得できます。
//  仕様上書き換え可能ですが書き換え厳禁。
//  押された回数と離された回数をカウントしているだけなので、
//  不備があるかもしれません。
//  例) if(pressedKeyNum == 0){ KeyConfig_A = keyCode; }
//      何か1つキーが押されたら、キーコンフィグを書き換える。
//
//


// キーの押されている数
int pressedKeyNum = 0;

// キーが押されたらTrueに書き換え
void keyPressed() {
  try {
    keyCodeToEnum[keyCode].set(true);
  } 
  catch(IndexOutOfBoundsException ignore) {
    // キーコード溢れのエラーは無視
  }
  pressedKeyNum++;
}

// キーが離されたらFalseに書き換え
void keyReleased() {
  try {
    keyCodeToEnum[keyCode].set(false);
  } 
  catch(IndexOutOfBoundsException ignore) {
    // キーコード溢れのエラーは無視
  }
  pressedKeyNum--;
}


// キーコードとキーEnumの変換表
// 未定義部分はundefined
// キーコードあふれ対策済みです

final Key keyCodeToEnum[] = {
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.backspace, 
  Key.tab, 
  Key.enter, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.shift, 
  Key.ctrl, 
  Key.alt, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.escape, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.space, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.left, 
  Key.up, 
  Key.right, 
  Key.down, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.comma, 
  Key.hyphen, 
  Key.period, 
  Key.slash, 
  Key.n0, 
  Key.n1, 
  Key.n2, 
  Key.n3, 
  Key.n4, 
  Key.n5, 
  Key.n6, 
  Key.n7, 
  Key.n8, 
  Key.n9, 
  Key.undefined, 
  Key.semicolon, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.a, 
  Key.b, 
  Key.c, 
  Key.d, 
  Key.e, 
  Key.f, 
  Key.g, 
  Key.h, 
  Key.i, 
  Key.j, 
  Key.k, 
  Key.l, 
  Key.m, 
  Key.n, 
  Key.o, 
  Key.p, 
  Key.q, 
  Key.r, 
  Key.s, 
  Key.t, 
  Key.u, 
  Key.v, 
  Key.w, 
  Key.x, 
  Key.y, 
  Key.z, 
  Key.bracketOpen, 
  Key.backslash, 
  Key.bracketClose, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.f1, 
  Key.f2, 
  Key.f3, 
  Key.f4, 
  Key.f5, 
  Key.f6, 
  Key.f7, 
  Key.f8, 
  Key.f9, 
  Key.f10, 
  Key.f11, 
  Key.f12, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.delete, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.numlk, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.insert, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.undefined, 
  Key.at, 
  Key.colon, 
  Key.caret, 
};

enum Key {
  undefined(-1), 
    backspace(8), 
    tab(9, '\t'), 
    enter(10), 
    shift(16), 
    ctrl(17), 
    alt(18), 
    escape(27), 
    space(32, ' '), 
    left(38), 
    up(39), 
    right(40), 
    down(41), 
    comma(44, ','), 
    hyphen(45, '-'), 
    period(46, '.'), 
    slash(47, '/'), 
    n0(48, '0'), 
    n1(49, '1'), 
    n2(50, '2'), 
    n3(51, '3'), 
    n4(52, '4'), 
    n5(53, '5'), 
    n6(54, '6'), 
    n7(55, '7'), 
    n8(56, '8'), 
    n9(57, '9'), 
    semicolon(59, ';'), 
    a(65, 'a'), 
    b(66, 'b'), 
    c(67, 'c'), 
    d(68, 'd'), 
    e(69, 'e'), 
    f(70, 'f'), 
    g(71, 'g'), 
    h(72, 'h'), 
    i(73, 'i'), 
    j(74, 'j'), 
    k(75, 'k'), 
    l(76, 'l'), 
    m(77, 'm'), 
    n(78, 'n'), 
    o(79, 'o'), 
    p(80, 'p'), 
    q(81, 'q'), 
    r(82, 'r'), 
    s(83, 's'), 
    t(84, 't'), 
    u(85, 'u'), 
    v(86, 'v'), 
    w(87, 'w'), 
    x(88, 'x'), 
    y(89, 'y'), 
    z(90, 'z'), 
    bracketOpen(91, '['), 
    backslash(92, '\\'), 
    bracketClose(93, ']'), 
    f1(112), 
    f2(113), 
    f3(114), 
    f4(115), 
    f5(116), 
    f6(117), 
    f7(118), 
    f8(119), 
    f9(120), 
    f10(121), 
    f11(122), 
    f12(123), 
    delete(127), 
    numlk(144), 
    insert(155), 
    at(512, '@'), 
    colon(513, ':'), 
    caret(514, '^');

  final int id;
  final char key;
  protected boolean isPressed;
  Key(int key_code) {
    id = key_code;
    key = '\0';
    isPressed = false;
  }
  Key(int key_code, char __key) {
    id = key_code;
    key = __key;
    isPressed = false;
  }
  boolean get() {
    return isPressed;
  }
  void set(boolean keyState) {
    isPressed = keyState;
  }
}

// マウスが押された時trueに
void mousePressed() {
  try {
    mouseToEnum[mouseButton].set(true);
  }
  catch(IndexOutOfBoundsException ignore) {
    // 配列あふれは無視
  }
}

// マウスが離された時falseに
void mouseReleased() {
  try {
    mouseToEnum[mouseButton].set(false);
  }
  catch(IndexOutOfBoundsException ignore) {
    // 配列あふれは無視
  }
}

final Mouse mouseToEnum[] = {
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.c, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.undefined, 
  Mouse.r, 
  Mouse.undefined, 
  Mouse.l, 
};

enum Mouse {
  undefined(-1), 
    r(37), 
    c(3), 
    l(39);

  final int id;
  protected boolean isPressed;
  Mouse(int key_code) {
    id = key_code;
    isPressed = false;
  }
  boolean get() {
    return isPressed;
  }
  void set(boolean keyState) {
    isPressed = keyState;
  }
}