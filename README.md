# CS-308-Final-project


 This program exercises the motor.
 The motor is rotated in a clockwise
 direction and the number of revolutions
 is displayed on Display 0 (the 7-segment
 display). The display only shows up to
 nine revolutions and then resets.

 The motor sensor is connected to P3.5,
 which is the external clock source for 
 timer 1. Therefore, timer 1 is put into
 event counting mode. In this way, the
 the timer increments once every motor
 revolution.

 The value in timer 1 low byte is moved
 to A and this value together with the
 data pointer (DPH and DPL) are used to
 get the 7-segment code from program memory.
 The code is then sent to P1 to put the
 appropriate number on the Display 0.

 The motor can be changed from clockwise
 to anti-clockwise by pressing SW0 (on P2.0).
 The motor direction is stored in F0 (1 for
 clockwise, 0 for anti-clockwise). The
 value in F0 is sent to Display 0's decimal
 point (P1.7). This indicates the motor's
 direction - if the decimal point is lit,
 the motor is rotating anti-clockwise, while
 if it is not lit the motor is rotating
 clockwise.

 The value in F0 is compared with the
 value of SW0. If they are the same the
 motor direction does not need to be
 changed. If they are not the same it means
 the user has pressed SW0 and the motor
 direction must be reversed. When this
 happens the new motor direction is then
 stored in F0.

