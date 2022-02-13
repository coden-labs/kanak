import 'dart:math';

const TEN = 10;

class CurrencyValue {
    int value = 0;
    int exponent = 8;
    int defaultRepresentation = 2;

    CurrencyValue operator +(CurrencyValue other) {

      int maxExponent = max(this.exponent, other.exponent);

      int thisValue = this.value * pow(TEN, maxExponent - this.exponent).toInt();
      int otherValue = other.value * pow(TEN, maxExponent - other.exponent).toInt();

      CurrencyValue sumValue = CurrencyValue(0);
      sumValue.value = thisValue + otherValue;
      sumValue.exponent = maxExponent;
      sumValue.defaultRepresentation = max(this.defaultRepresentation, other.defaultRepresentation);

      return sumValue;
    }

    CurrencyValue operator -(CurrencyValue other) {

      int maxExponent = max(this.exponent, other.exponent);

      int thisValue = this.value * pow(TEN, maxExponent - this.exponent).toInt();
      int otherValue = other.value * pow(TEN, maxExponent - other.exponent).toInt();

      CurrencyValue diffValue = CurrencyValue(0);
      diffValue.value = thisValue - otherValue;
      diffValue.exponent = maxExponent;
      diffValue.defaultRepresentation = max(this.defaultRepresentation, other.defaultRepresentation);

      return diffValue;
    }

    CurrencyValue operator *(int multiplier) {

      CurrencyValue mulValue = CurrencyValue(0);
      mulValue.value = this.value * multiplier;
      mulValue.exponent = this.exponent;
      mulValue.defaultRepresentation = this.defaultRepresentation;

      return mulValue;
    }

    CurrencyValue(int value) {
      this.value = value;
      this.exponent = 0;
      this.defaultRepresentation = 2;
    }


}