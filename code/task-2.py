#!/usr/bin/env python
import unittest

from automata.pda.npda import NPDA

npda = NPDA(
    states={"s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11"},
    input_symbols={"0", "1"},
    stack_symbols={"0", "1", "#"},
    transitions={
        "s0": {
            "0": {
                "#": {("s4", "#")},
                "0": {("s4", "0")},
            },
            "1": {
                "#": {("s1", "#")},
                "0": {("s1", "0")},
            },
        },
        "s1": {
            "0": {
                "#": {("s2", "#")},
                "0": {("s2", "0")},
            },
            "1": {
                "#": {("s1", "#")},
                "0": {("s1", "0")},
            },
        },
        "s2": {
            "0": {
                "#": {("s4", "#")},
                "0": {("s4", "0")},
            },
            "1": {
                "#": {("s6", "#")},
                "0": {("s3", "")},
            },
        },
        "s3": {
            "0": {
                # "#": {("s5", "#")},
                "0": {("s5", ("0", "0"))},
            },
            "1": {
                "#": {("s1", "#")},
                "0": {("s1", "0")},
            },
        },
        "s4": {
            "0": {
                "#": {("s4", "#")},
                "0": {("s4", "0")},
            },
            "1": {
                "#": {("s3", "#")},
                "0": {("s3", "0")},
            },
        },
        "s5": {
            "0": {
                "#": {("s4", "#")},
                "0": {("s4", "0")},
            },
            "1": {
                "#": {("s3", "#")},
                "0": {("s3", "")},
            },
        },
        "s6": {
            "0": {
                "#": {("s11", "#")},
                # "0": {("s4", "0")}, # WARNING: not used
            },
            "1": {
                "#": {("s7", "#")},
                "1": {("s7", "1")},
            },
        },
        "s7": {
            "0": {
                "#": {("s8", "#")},
                "1": {("s8", "1")},
            },
            "1": {
                "#": {("s7", "#")},
                "1": {("s7", "1")},
            },
        },
        "s8": {
            "0": {
                "#": {("s10", "#")},
                "1": {("s10", "1")},
            },
            "1": {
                "#": {("s9", "#")},
                "1": {("s9", ("1", "1"))},
            },
        },
        "s9": {
            "0": {
                "#": {("s4", "#")},
                "1": {("s8", "")},
            },
            "1": {
                "1": {("s7", "1")},
            },
        },
        "s10": {
            "0": {
                "#": {("s10", "#")},
                "1": {("s10", "1")},
            },
            "1": {
                "#": {("s9", "#")},
                "1": {("s9", "1")},
            },
        },
        "s11": {
            "0": {
                "#": {("s4", "#")},
                "0": {("s4", "0")},
            },
            "1": {
                "#": {("s6", "#")},
                "0": {("s6", "0")},
            },
        },
    },
    initial_state="s0",
    initial_stack_symbol="#",
    final_states={"s6", "s7", "s8", "s9", "s10"},
    acceptance_mode="final_state",
)


class TestNPDA(unittest.TestCase):
    def test_accepts_input(self):
        self.assertEqual(npda.accepts_input("101"), True)
        self.assertEqual(npda.accepts_input("1010"), False)
        self.assertEqual(npda.accepts_input("10101"), True)
        self.assertEqual(npda.accepts_input("101010"), False)
        self.assertEqual(npda.accepts_input("01011011001001010101"), False)
        self.assertEqual(npda.accepts_input("10011100110101001110"), False)
        self.assertEqual(npda.accepts_input("01100100110010111001"), False)
        self.assertEqual(npda.accepts_input("10101011101000100110"), False)
        self.assertEqual(npda.accepts_input("00111010110011100101"), True)  # BUG:
        self.assertEqual(npda.accepts_input("11010001101011001100"), True)  # BUG:
        self.assertEqual(npda.accepts_input("01000110110010110110"), True)
        self.assertEqual(npda.accepts_input("10011101001100101101"), True)
        self.assertEqual(npda.accepts_input("00110101010011011011"), True)  # BUG:
        self.assertEqual(npda.accepts_input("11001001111101010100"), False)
        self.assertEqual(npda.accepts_input("01001011001101100101"), False)
        self.assertEqual(npda.accepts_input("10100110110011010100"), True)  # BUG:
        self.assertEqual(npda.accepts_input("01110011000101011011"), True)
        self.assertEqual(npda.accepts_input("10001001010110101010"), False)
        self.assertEqual(npda.accepts_input("00101110111011001001"), False)
        self.assertEqual(npda.accepts_input("11010010001001011101"), False)  # BUG:
        self.assertEqual(npda.accepts_input("01010100110100110101"), False)  # BUG:
        self.assertEqual(npda.accepts_input("10001101010110001110"), True)  # BUG:
        self.assertEqual(npda.accepts_input("01100110011001000101"), False)
        self.assertEqual(npda.accepts_input("10101101101010110100"), True)  # BUG:


if __name__ == "__main__":
    unittest.main()
