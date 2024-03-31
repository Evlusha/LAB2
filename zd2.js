class zd2 {
  static Main2() {
    const text = ["qaq", "._.", "3", "2"];
    const uniqueTextCount = zd2.Repac(text, 4);
    console.log("Количество уникальных слов на азбуке Морзе: " + uniqueTextCount);
  }

  static Repac(text, size) {
    const uniqueText = new Set();
    for (let i = 0; i < size; i++) {
      let word = text[i];
      word = word.split('').sort().join('');
      uniqueText.add(word);
    }
    return uniqueText.size;
  }
}

zd2.Main2();
