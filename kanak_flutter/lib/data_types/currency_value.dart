import 'dart:math';

const TEN = 10;

class CurrencyValue {
  int value = 0;
  int exponent = 8;
  int defaultRepresentation = 2;

  CurrencyValue operator +(CurrencyValue other) {
    int maxExponent = max(this.exponent, other.exponent);

    int thisValue = this.value * pow(TEN, maxExponent - this.exponent).toInt();
    int otherValue =
        other.value * pow(TEN, maxExponent - other.exponent).toInt();

    CurrencyValue sumValue = CurrencyValue(0);
    sumValue.value = thisValue + otherValue;
    sumValue.exponent = maxExponent;
    sumValue.defaultRepresentation =
        max(this.defaultRepresentation, other.defaultRepresentation);

    return sumValue;
  }

  double toDouble() {


    return this.value.toDouble()/pow(TEN, this.exponent).toDouble();
  }

  String toString() {

    String valueString = this.value.toString();
    int valueLen = valueString.length;
    int moreThanUnityDigits = valueLen - this.exponent;
    return (
      this.value.toString().substring(0, moreThanUnityDigits) + "." +
      this.value.toString().substring(moreThanUnityDigits, valueLen)
    );
  }

  CurrencyValue operator -(CurrencyValue other) {
    int maxExponent = max(this.exponent, other.exponent);

    int thisValue = this.value * pow(TEN, maxExponent - this.exponent).toInt();
    int otherValue =
        other.value * pow(TEN, maxExponent - other.exponent).toInt();

    CurrencyValue diffValue = CurrencyValue(0);
    diffValue.value = thisValue - otherValue;
    diffValue.exponent = maxExponent;
    diffValue.defaultRepresentation =
        max(this.defaultRepresentation, other.defaultRepresentation);

    return diffValue;
  }

  CurrencyValue operator *(int multiplier) {
    CurrencyValue mulValue = CurrencyValue(0);
    mulValue.value = this.value * multiplier;
    mulValue.exponent = this.exponent;
    mulValue.defaultRepresentation = this.defaultRepresentation;

    return mulValue;
  }

  CurrencyValue(int value, {int defaultRepresentation = 2}) {
    this.value = value;
    this.exponent = 0;
    this.defaultRepresentation = defaultRepresentation;
  }

  CurrencyValue.fromDouble(double value, {int displayRepresentation = 2}) {
    // This is a very bad way now but will find a better way
    // and replace
    var exponent = 0;
    var maxError = 10e-15;

    print(value);

    while (((value - value.toInt()) > maxError) && (exponent <= 12)) {
      exponent = exponent + 1;
      value = value * 10;
    }

    this.value = value.toInt();
    this.exponent = exponent;
    this.defaultRepresentation = defaultRepresentation;
  }
}
