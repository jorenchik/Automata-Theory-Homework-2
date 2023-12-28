import unittest

from task_2 import npda


class TestNPDA(unittest.TestCase):
    def test_accepts_input_1(self):
        self.assertEqual(npda.accepts_input("101"), True)

    def test_accepts_input_2(self):
        self.assertEqual(npda.accepts_input("1010"), False)

    def test_accepts_input_3(self):
        self.assertEqual(npda.accepts_input("10101"), True)

    def test_accepts_input_4(self):
        self.assertEqual(npda.accepts_input("101010"), False)

    def test_accepts_input_5(self):
        self.assertEqual(npda.accepts_input("01011011001001010101"), False)

    def test_accepts_input_6(self):
        self.assertEqual(npda.accepts_input("10011100110101001110"), False)

    def test_accepts_input_7(self):
        self.assertEqual(npda.accepts_input("01100100110010111001"), False)

    def test_accepts_input_8(self):
        self.assertEqual(npda.accepts_input("10101011101000100110"), False)

    def test_accepts_input_9(self):
        self.assertEqual(npda.accepts_input("00111010110011100101"), True)  # BUG:

    def test_accepts_input_10(self):
        self.assertEqual(npda.accepts_input("11010001101011001100"), True)  # BUG: fixed

    def test_accepts_input_11(self):
        self.assertEqual(npda.accepts_input("01000110110010110110"), True)  # BUG: new

    def test_accepts_input_12(self):
        self.assertEqual(npda.accepts_input("10011101001100101101"), True)  # BUG: new

    def test_accepts_input_13(self):
        self.assertEqual(npda.accepts_input("00110101010011011011"), True)  # BUG: fixed

    def test_accepts_input_14(self):
        self.assertEqual(npda.accepts_input("11001001111101010100"), False)

    def test_accepts_input_15(self):
        self.assertEqual(npda.accepts_input("01001011001101100101"), False)

    def test_accepts_input_16(self):
        self.assertEqual(npda.accepts_input("10100110110011010100"), True)  # BUG:

    def test_accepts_input_17(self):
        self.assertEqual(npda.accepts_input("01110011000101011011"), True)  # BUG: new

    def test_accepts_input_18(self):
        self.assertEqual(npda.accepts_input("10001001010110101010"), False)

    def test_accepts_input_19(self):
        self.assertEqual(npda.accepts_input("00101110111011001001"), False)

    def test_accepts_input_20(self):
        self.assertEqual(
            npda.accepts_input("11010010001001011101"), False
        )  # BUG: fixed

    def test_accepts_input_21(self):
        self.assertEqual(
            npda.accepts_input("01010100110100110101"), False
        )  # BUG: fixed

    def test_accepts_input_22(self):
        self.assertEqual(npda.accepts_input("10001101010110001110"), True)  # BUG: fixed

    def test_accepts_input_23(self):
        self.assertEqual(npda.accepts_input("01100110011001000101"), False)

    def test_accepts_input_24(self):
        self.assertEqual(npda.accepts_input("10101101101010110100"), True)  # BUG:


if __name__ == "__main__":
    unittest.main()
