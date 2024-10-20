import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_ics_homescreen/core/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaml/yaml.dart';

class KuksaConfig {
  final String hostname;
  final int port;
  final String authorization;
  final bool useTls;
  final List<int> caCertificate;
  final String tlsServerName;

  static String defaultHostname = 'localhost';
  static int defaultPort = 55555;
  static String defaultCaCertPath = '/etc/kuksa-val/CA.pem';

  KuksaConfig(
      {required this.hostname,
      required this.port,
      required this.authorization,
      required this.useTls,
      required this.caCertificate,
      required this.tlsServerName});

  static KuksaConfig defaultConfig() {
    return KuksaConfig(
        hostname: KuksaConfig.defaultHostname,
        port: KuksaConfig.defaultPort,
        authorization: "",
        useTls: false,
        caCertificate: [],
        tlsServerName: "");
  }
}

class RadioConfig {
  final String hostname;
  final int port;
  final String presets;

  static String defaultHostname = 'localhost';
  static int defaultPort = 50053;
  static String defaultPresets =
      '/etc/xdg/AGL/ics-homescreen/radio-presets.yaml';

  RadioConfig(
      {required this.hostname, required this.port, required this.presets});

  static RadioConfig defaultConfig() {
    return RadioConfig(
        hostname: RadioConfig.defaultHostname,
        port: RadioConfig.defaultPort,
        presets: RadioConfig.defaultPresets);
  }
}

class StorageConfig {
  final String hostname;
  final int port;

  static String defaultHostname = 'localhost';
  static int defaultPort = 50054;

  StorageConfig(
      {required this.hostname, required this.port});

  static StorageConfig defaultConfig() {
    return StorageConfig(
        hostname: StorageConfig.defaultHostname,
        port: StorageConfig.defaultPort);
  }
}

class MpdConfig {
  final String hostname;
  final int port;

  static String defaultHostname = 'localhost';
  static int defaultPort = 6600;

  MpdConfig({required this.hostname, required this.port});

  static MpdConfig defaultConfig() {
    return MpdConfig(
        hostname: MpdConfig.defaultHostname, port: MpdConfig.defaultPort);
  }
}

class VoiceAgentConfig {
  final String hostname;
  final int port;

  static String defaultHostname = 'localhost';
  static int defaultPort = 51053;

  VoiceAgentConfig({required this.hostname,required this.port});

  static VoiceAgentConfig defaultConfig() {
    return VoiceAgentConfig(
        hostname: VoiceAgentConfig.defaultHostname, port: VoiceAgentConfig.defaultPort);
  }
}

class AppConfig {
  final bool disableBkgAnimation;
  final bool plainBackground;
  final bool randomHybridAnimation;
  final KuksaConfig kuksaConfig;
  final RadioConfig radioConfig;
  final StorageConfig storageConfig;
  final MpdConfig mpdConfig;
  final VoiceAgentConfig voiceAgentConfig;
  final bool enableVoiceAssistant;

  static String configFilePath = '/etc/xdg/AGL/ics-homescreen.yaml';

  AppConfig(
      {required this.disableBkgAnimation,
      required this.plainBackground,
      required this.randomHybridAnimation,
      required this.kuksaConfig,
      required this.radioConfig,
      required this.storageConfig,
      required this.mpdConfig,
      required this.voiceAgentConfig,
      required this.enableVoiceAssistant});

  static KuksaConfig parseKuksaConfig(YamlMap kuksaMap) {
    try {
      String hostname = KuksaConfig.defaultHostname;
      if (kuksaMap.containsKey('hostname')) {
        hostname = kuksaMap['hostname'];
      }

      int port = KuksaConfig.defaultPort;
      if (kuksaMap.containsKey('port')) {
        port = kuksaMap['port'];
      }

      String token = "";
      if (kuksaMap.containsKey('authorization')) {
        String s = kuksaMap['authorization'];
        if (s.isNotEmpty) {
          if (s.startsWith("/")) {
            debugPrint("Reading authorization token $s");
            try {
              token = File(s).readAsStringSync();
            } catch (_) {
              print("ERROR: Could not read authorization token file $token");
              token = "";
            }
          } else {
            token = s;
          }
        }
      }
      //debugPrint("authorization = $token");

      bool useTls = false;
      if (kuksaMap.containsKey('use-tls')) {
        var value = kuksaMap['use-tls'];
        if (value is bool) useTls = value;
      }
      //debugPrint("Use TLS = $use_tls");

      List<int> caCert = [];
      String caPath = KuksaConfig.defaultCaCertPath;
      if (kuksaMap.containsKey('ca-certificate')) {
        caPath = kuksaMap['ca-certificate'];
      }
      try {
        caCert = File(caPath).readAsBytesSync();
      } catch (_) {
        print("ERROR: Could not read CA certificate file $caPath");
        caCert = [];
      }
      //debugPrint("CA cert = $ca_cert");

      String tlsServerName = "";
      if (kuksaMap.containsKey('tls-server-name')) {
        tlsServerName = kuksaMap['tls-server-name'];
      }

      return KuksaConfig(
          hostname: hostname,
          port: port,
          authorization: token,
          useTls: useTls,
          caCertificate: caCert,
          tlsServerName: tlsServerName);
    } catch (_) {
      debugPrint("Invalid KUKSA.val configuration, using defaults");
      return KuksaConfig.defaultConfig();
    }
  }

  static RadioConfig parseRadioConfig(YamlMap radioMap) {
    try {
      String hostname = RadioConfig.defaultHostname;
      if (radioMap.containsKey('hostname')) {
        hostname = radioMap['hostname'];
      }

      int port = RadioConfig.defaultPort;
      if (radioMap.containsKey('port')) {
        port = radioMap['port'];
      }

      String presets = RadioConfig.defaultPresets;
      if (radioMap.containsKey('presets')) {
        hostname = radioMap['presets'];
      }

      return RadioConfig(hostname: hostname, port: port, presets: presets);
    } catch (_) {
      debugPrint("Invalid radio configuration, using defaults");
      return RadioConfig.defaultConfig();
    }
  }

    static StorageConfig parseStorageConfig(YamlMap storageMap) {
    try {
      String hostname = StorageConfig.defaultHostname;
      if (storageMap.containsKey('hostname')) {
        hostname = storageMap['hostname'];
      }

      int port = StorageConfig.defaultPort;
      if (storageMap.containsKey('port')) {
        port = storageMap['port'];
      }

      return StorageConfig(hostname: hostname, port: port);
    } catch (_) {
      debugPrint("Invalid storage configuration, using defaults");
      return StorageConfig.defaultConfig();
    }
  }

  static MpdConfig parseMpdConfig(YamlMap mpdMap) {
    try {
      String hostname = MpdConfig.defaultHostname;
      if (mpdMap.containsKey('hostname')) {
        hostname = mpdMap['hostname'];
      }

      int port = MpdConfig.defaultPort;
      if (mpdMap.containsKey('port')) {
        port = mpdMap['port'];
      }

      return MpdConfig(hostname: hostname, port: port);
    } catch (_) {
      debugPrint("Invalid MPD configuration, using defaults");
      return MpdConfig.defaultConfig();
    }
  }

  static VoiceAgentConfig parseVoiceAgentConfig(YamlMap voiceAgentMap) {
    try {
      String hostname = VoiceAgentConfig.defaultHostname;
      if (voiceAgentMap.containsKey('hostname')) {
        hostname = voiceAgentMap['hostname'];
      }

      int port = VoiceAgentConfig.defaultPort;
      if (voiceAgentMap.containsKey('port')) {
        port = voiceAgentMap['port'];
      }

      return VoiceAgentConfig(hostname: hostname, port: port);
    } catch (_) {
      debugPrint("Invalid VoiceAgent configuration, using defaults");
      return VoiceAgentConfig.defaultConfig();
    }
  }
}

final appConfigProvider = Provider((ref) {
  final configFile = File(AppConfig.configFilePath);
  try {
    print("Reading configuration ${AppConfig.configFilePath}");
    String content = configFile.readAsStringSync();
    final dynamic yamlMap = loadYaml(content);

    KuksaConfig kuksaConfig;
    if (yamlMap.containsKey('kuksa')) {
      kuksaConfig = AppConfig.parseKuksaConfig(yamlMap['kuksa']);
    } else {
      kuksaConfig = KuksaConfig(
          hostname: KuksaConfig.defaultHostname,
          port: KuksaConfig.defaultPort,
          authorization: "",
          useTls: false,
          caCertificate: [],
          tlsServerName: "");
    }

    RadioConfig radioConfig;
    if (yamlMap.containsKey('radio')) {
      radioConfig = AppConfig.parseRadioConfig(yamlMap['radio']);
    } else {
      radioConfig = RadioConfig.defaultConfig();
    }

    StorageConfig storageConfig;
    if (yamlMap.containsKey('storage')) {
      storageConfig = AppConfig.parseStorageConfig(yamlMap['storage']);
    } else {
      storageConfig = StorageConfig.defaultConfig();
    }

    MpdConfig mpdConfig;
    if (yamlMap.containsKey('mpd')) {
      mpdConfig = AppConfig.parseMpdConfig(yamlMap['mpd']);
    } else {
      mpdConfig = MpdConfig.defaultConfig();
    }

    VoiceAgentConfig voiceAgentConfig;
    if(yamlMap.containsKey('voiceAgent')){
      voiceAgentConfig = AppConfig.parseVoiceAgentConfig(yamlMap['voiceAgent']);
    } else {
      voiceAgentConfig = VoiceAgentConfig.defaultConfig();
    }

    bool enableVoiceAssistant = enableVoiceAssistantDefault;
    if (yamlMap.containsKey('enable-voice-assistant')) {
      var value = yamlMap['enable-voice-assistant'];
      if (value is bool) {
        enableVoiceAssistant = value;
      }
    }

    bool disableBkgAnimation = disableBkgAnimationDefault;
    if (yamlMap.containsKey('disable-bg-animation')) {
      var value = yamlMap['disable-bg-animation'];
      if (value is bool) {
        disableBkgAnimation = value;
      }
    }

    bool plainBackground = false;
    if (yamlMap.containsKey('plain-bg')) {
      var value = yamlMap['plain-bg'];
      if (value is bool) {
        plainBackground = value;
      }
    }

    bool randomHybridAnimation = randomHybridAnimationDefault;
    if (yamlMap.containsKey('random-hybrid-animation')) {
      var value = yamlMap['random-hybrid-animation'];
      if (value is bool) {
        randomHybridAnimation = value;
      }
    }

    return AppConfig(
        disableBkgAnimation: disableBkgAnimation,
        plainBackground: plainBackground,
        randomHybridAnimation: randomHybridAnimation,
        kuksaConfig: kuksaConfig,
        radioConfig: radioConfig,
        storageConfig: storageConfig,
        mpdConfig: mpdConfig,
        voiceAgentConfig: voiceAgentConfig,
        enableVoiceAssistant: enableVoiceAssistant);
  } catch (_) {
    return AppConfig(
        disableBkgAnimation: false,
        plainBackground: false,
        randomHybridAnimation: false,
        kuksaConfig: KuksaConfig.defaultConfig(),
        radioConfig: RadioConfig.defaultConfig(),
        storageConfig: StorageConfig.defaultConfig(),
        mpdConfig: MpdConfig.defaultConfig(),
        voiceAgentConfig: VoiceAgentConfig.defaultConfig(),
        enableVoiceAssistant: false);
  }
});
