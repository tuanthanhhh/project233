//#include <HardwareSerial.h>
#include <WiFi.h>
#include <PubSubClient.h>

// Thông tin WiFi
const char* ssid = "ThanhLe";
const char* password = "123456789";

// Thông tin MQTT cho ThingBoard
const char* mqtt_server = "thingsboard.cloud";
const char* access_token = "092Pp7Vzcrwmg2zFbL6l";  // Token của thiết bị trên ThingBoard

WiFiClient espClient;
PubSubClient client(espClient);

//HardwareSerial SerialSTM(2);  // Sử dụng UART2

void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    if (client.connect("ESP32_Client", access_token, NULL)) {
      Serial.println("connected");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}

void setup() {
  Serial.begin(115200);  // Giao tiếp với máy tính
  //Serial2.begin(9600, SERIAL_8N1, 16, 17);  // TX2 là GPIO 17, RX2 là GPIO 16

  setup_wifi();
  client.setServer(mqtt_server, 1883);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  if (Serial.available()) {
    String data = Serial.readStringUntil('\n');  // Đọc dữ liệu từ STM32
    int heart_rate, spo2;
    sscanf(data.c_str(), "%d,%d", &heart_rate, &spo2);
    
    Serial.println(heart_rate);
    Serial.println(spo2);

    // Định dạng dữ liệu JSON để gửi lên ThingBoard
   // String payload = "{\"heart_rate\":" + heart_rate + \"spo2"\+ spo2 "\}";
    String payload = "{\"heart_rate\": " + String(heart_rate) + ", \"spo2\": " + String(spo2) + "}";

    // Gửi dữ liệu lên ThingBoard
    if (client.publish("v1/devices/me/telemetry", payload.c_str())) {
      Serial.println("Data sent to ThingBoard");
    } else {
      Serial.println("Failed to send data");
    }
  }
  //delay(500);  // Đọc và gửi mỗi giây
}
