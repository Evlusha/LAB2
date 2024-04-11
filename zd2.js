let morseAlphabet = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--.."];

let charToMorse = new Map();

function initCharToMorseMap() {
  for (let c = 'a'; c <= 'z'; ++c) {
    charToMorse.set(c, morseAlphabet[c.charCodeAt(0) - 'a'.charCodeAt(0)]);
  }
}

function generatePermutations(str, l, r, permutations) {
  if (l == r) {
    permutations.add(str);
  } else {
    for (let i = l; i <= r; i++) {
      str = swapChars(str, l, i);
      generatePermutations(str, l + 1, r, permutations);
      str = swapChars(str, l, i);
    }
  }
}

function swapChars(str, i, j) {
  let arr = str.split('');
  [arr[i], arr[j]] = [arr[j], arr[i]];
  return arr.join('');
}

function stringToMorse(str) {
  let morseString = "";
  for (let c of str) {
    morseString += charToMorse.get(c);
  }
  return morseString;
}

initCharToMorseMap();

let input = prompt("Введите буквы для перестановки: ");
let permutations = new Set();
generatePermutations(input, 0, input.length - 1, permutations);

let uniqueMorseWords = new Set();
for (let word of permutations) {
  uniqueMorseWords.add(stringToMorse(word));
}

console.log("Уникальные слова в языке Морзе: ");
for (let morseWord of uniqueMorseWords) {
  console.log(morseWord + "|| ");
}
