class Questions {
  String? category;
  String? id;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  Question? question;
  List<String>? tags;
  String? type;
  String? difficulty;
  bool? isNiche;

  Questions(
      {this.category,
      this.id,
      this.correctAnswer,
      this.incorrectAnswers,
      this.question,
      this.tags,
      this.type,
      this.difficulty,
      this.isNiche});

  Questions.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    id = json['id'];
    correctAnswer = json['correctAnswer'];
    incorrectAnswers = json['incorrectAnswers'].cast<String>();
    question =
        json['question'] != null ? Question?.fromJson(json['question']) : null;
    tags = json['tags'].cast<String>();
    type = json['type'];
    difficulty = json['difficulty'];
    isNiche = json['isNiche'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['category'] = category;
    data['id'] = id;
    data['correctAnswer'] = correctAnswer;
    data['incorrectAnswers'] = incorrectAnswers;
    if (question != null) {
      data['question'] = question?.toJson();
    }
    data['tags'] = tags;
    data['type'] = type;
    data['difficulty'] = difficulty;

    data['isNiche'] = isNiche;
    return data;
  }
}

class Question {
  String? text;

  Question({this.text});

  Question.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}
