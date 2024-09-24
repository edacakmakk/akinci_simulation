#include "lsm6dsm.h"

#define delayms 100

LSM6DSM IMU;
// float elapsedTime, currentTime, previousTime;
// float yaw;

void setup() {
  Serial.begin(115200);
  IMU.begin();
}

void loop() {
  float accelX = IMU.readFloatAccelX() * 2;
  float accelY = IMU.readFloatAccelY() * 2;
  float GyroZ = IMU.readFloatGyroZ();

  // float gyroX = IMU.readFloatGyroX();
  // float gyroY = IMU.readFloatGyroY();

  //float azimuth = atan2(gyroY, gyroX) * -180 / PI;

  // if (azimuth < 0) {
  //   azimuth += 360;
  // }
  
  Serial.print(accelX);
  Serial.print(",");
  Serial.print(accelY);
  Serial.print(",");
  Serial.println(GyroZ);

  delay(delayms);
}