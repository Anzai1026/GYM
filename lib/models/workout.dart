
class Workout {
  final String name;
  final String description;

  Workout({required this.name, required this.description});
}

class BodyPart {
  final String name;
  final List<Workout> workouts;

  BodyPart({required this.name, required this.workouts});
}

final List<BodyPart> bodyParts = [
  BodyPart(
    name: '胸',
    workouts: [
      Workout(name: 'ベンチプレス', description: '胸筋を鍛える王道トレーニング'),
      Workout(name: '腕立て伏せ', description: '自重で行う胸のトレーニング'),
    ],
  ),
  BodyPart(
    name: '腕',
    workouts: [
      Workout(name: 'ダンベルカール', description: '上腕二頭筋を集中して鍛える'),
      Workout(name: 'トライセプス・ディップス', description: '上腕三頭筋に効く'),
    ],
  ),
  BodyPart(
    name: '背中',
    workouts: [
      Workout(name: '懸垂', description: '広背筋を鍛える基本の種目'),
      Workout(name: 'デッドリフト', description: '背中全体を鍛える高強度種目'),
    ],
  ),
  BodyPart(
    name: '腹筋',
    workouts: [
      Workout(name: 'クランチ', description: '腹直筋を鍛える基本種目'),
      Workout(name: 'レッグレイズ', description: '下腹部を集中的に鍛える'),
    ],
  ),
  BodyPart(
    name: '足',
    workouts: [
      Workout(name: 'スクワット', description: '脚全体を鍛える王道種目'),
      Workout(name: 'レッグプレス', description: '太ももを重点的に鍛える'),
    ],
  ),
];
