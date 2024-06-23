class BMI {
  static (double, String, String) calculate(
      {required int weightKg, required int heightCm}) {
    double heightM = heightCm / 100;
    double bmi = weightKg / (heightM * heightM);
    String message = "You Must Eat More!!";

    String category = 'UnderWeight';
    if (bmi < 16.0) {
      category = "Underweight (Servere Thinness)";
      message = "It is better to eat foods that are very useful.";
    } else if (bmi >= 16.0 && bmi <= 17) {
      category = "Underweight (Moderate Thinness)";
      message = "Additional meals should be eaten.";
    } else if (bmi >= 17.0 && bmi <= 18.5) {
      category = "Underweight (Mild Thinness)";
      message = "A little more food should be eaten.";
    } else if (bmi > 18.5 && bmi <= 25.0) {
      category = "Nomal";
      message = "Good health";
    } else if (bmi >= 25 && bmi <= 30) {
      category = "Overweight (Pre-obese)";
      message = "Eating less should be done.";
    } else if (bmi > 30.0 && bmi <= 35.0) {
      category = "Obese I";
      message = "Exercise should be done regularly.";
    } else if (bmi >= 35.0 && bmi <= 40.0) {
      category = "Obese II";
      message = "Exercise and diet should be carried out.";
    } else if (bmi >= 40) {
      category = "Obese III";
      message = "Weight loss should be carried out immediately.";
    }
    return (bmi, category, message);
  }
}
