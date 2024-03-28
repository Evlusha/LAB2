function main() {
const readline = require('readline');
const rl = readline.createInterface({
input: process.stdin,
output: process.stdout
});

rl.question('Введите текст: ', (text) => {
for (let i = 0; i < text.length - 2; i++) {
if (text.charAt(i) === text.charAt(i + 1) && text.charAt(i + 1) === text.charAt(i + 2)) {
text = text.substring(0, i + 2) + randomChar() + text.substring(i + 3);
}
}
console.log(text);
rl.close();
});
}

function randomChar() {
const chars = "abcdefghijklmnopqrstuvwxyz";
return chars.charAt(Math.floor(Math.random() * chars.length));
}

main();
