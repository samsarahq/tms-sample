[block:html]
{
  "html": "<div style=\"padding:56.25% 0 0 0;position:relative;\">\n<iframe src=\"https://player.vimeo.com/video/981594222?h=cc34e53d82&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479\" frameborder=\"0\" allow=\"autoplay; fullscreen; picture-in-picture; clipboard-write\" style=\"position:absolute;top:0;left:0;width:100%;height:100%;\" title=\"Data Streaming with Kafka\"></iframe>\n  <script src=\"https://player.vimeo.com/api/player.js\"></script>"
}
[/block]


<br />

**Contents**

1. [Supported Data Entities](https://developers.samsara.com/docs/kafka-connector#supported-data-entities)
2. [Data Streaming Parameters](https://developers.samsara.com/docs/kafka-connector#data-streaming-parameters)
3. [Data Resilience](https://developers.samsara.com/docs/kafka-connector#data-resilience)

## Supported Data Entities

The Samsara Kafka Connector supports the following data entities in the following categories:

- Asset Location (GPS) and Speed
- Vehicle Diagnostics
- Driver Compliance
- Events

> 📘 Feedback requested
>
> Samsara plans to support additional data entities over time based on customer feedback. We want to know what additional entities we should prioritize based on your data pipelining objectives and business goals. If you would like to see other data entities supported, **please share your feedback with your Samsara representatives.**

## Asset Readings

### GPS and Speed

```
{
  "happenedAtTime": "2023-12-19T17:57:21Z",
  "asset": {
    "externalIds": {
    },
    "id": "154924973293665"
  },
  "location": {
    "latitude": 38.253265915,
    "longitude": -80.018465004,
    "headingDegrees": 102,
    "accuracyMeters": 0,
    "geofence": {}
  },
  "speed": {
        "gpsSpeedMetersPerSecond": 43.8
        "ecuSpeedMetersPerSecond": 51.2
     }
}
```

***

## Vehicle Diagnostics

### AUX Inputs

**AUX Input Example**

```
{
  "vehicle": {
    "id": "281474990577720"
  },
      "auxInput1": {
        "name": "Boom",
        "time": "2020-01-27T07:06:25Z",
        "value": true
   },
}
```

**NFC Card Scan**

```
{
  "vehicle": {
    "id": "281474990577720"
  },
      "nfcCardScan": {
        "card": {
          "id": "835063"
   },
}
```

***

### Engine Diagnostics

**Ambient Air Temp**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "ambientAirTemperatureMilliC": {
    "time": "2024-08-28T20:00:40Z",
    "value": 736094
  }
}
```

<br />

**Barometric Pressure**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "barometricPressurePa": {
    "time": "2024-08-21T22:24:24Z",
    "value": 7000
  }
}
```

<br />

**Engine Coolant Temp**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "engineCoolantTemperatureMilliC": {
    "time": "2024-08-28T20:04:40Z",
    "value": 185000
  }
}
```

<br />

**Engine Oil Pressure**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "engineOilPressureKPa": {
    "time": "2024-08-21T22:24:24Z",
    "value": 56
  }
}
```

<br />

**Intake Manifold Temp**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "intakeManifoldTemperatureMilliC": {
    "time": "2024-08-21T22:24:32Z",
    "value": 0
  }
}
```

<br />

***

### Engine Immobilizer

**Immobilizer State**

```
{
  "vehicle": {
    "id": "281474991956423"
  },
  "engineImmobilizer": {
    "connected": false,
    "state": "ignition_enabled",
    "time": "2024-08-20T19:36:47Z"
  }
}
```

<br />

***

### Engine Metrics

**Engine Hours (ECU)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "obdEngineSeconds": {
    "time": "2024-08-28T20:49:49Z",
    "value": 22931460
  }
}
```

<br />

**Engine Hours (Synthetic)**

**Engine Load Percent**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "engineLoadPercent": {
    "time": "2024-08-21T22:24:24Z",
    "value": 50
  }
}
```

<br />

**Engine RPM**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "engineRpm": {
    "time": "2024-08-21T22:24:24Z",
    "value": 6038
  }
}
```

<br />

***

### Engine States

**Engine States**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "engineStates": {
    "time": "2024-08-21T22:24:32Z",
    "value": "Off"
  }
}
```

<br />

***

### EV Battery Diagnostics

**Battery Avg. Temp (EV)**

```
{
  "vehicle": {
    "id": "281474990577720"
  },
      "evAverageBatteryTemperatureMilliCelsius": {
        "time": "2020-01-27T07:06:25Z",
        "value": 1000
   },
}
```

**Battery Charging Current (EV)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "evChargingCurrentMilliAmp": {
    "time": "2024-08-21T19:34:40Z",
    "value": 0
  }
}
```

<br />

**Battery Charging Energy (EV)**

```
{
  "vehicle": {
    "id": "281474991956423"
  },
  "batteryMilliVolts": {
    "time": "2024-08-27T22:48:47Z",
    "value": 9889
  }
}
```

<br />

**Battery Charging Status (EV)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "evChargingStatus": {
    "time": "2024-08-21T22:24:32Z",
    "value": 0
  }
}
```

<br />

**Battery Charging Voltage (EV)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "evChargingVoltageMilliVolt": {
    "time": "2024-08-21T19:34:40Z",
    "value": 0
  }
}
```

<br />

**Battery State of Health (EV)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "evBatteryStateOfHealthMilliPercent": {
    "time": "2024-08-21T22:23:46Z",
    "value": 98800
  }
}
```

<br />

**Distance Driven (EV)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "evDistanceDrivenMeters": {
    "time": "2024-08-21T19:34:44Z",
    "value": 15
  }
}
```

<br />

**Regenerated Energy (EV)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "evRegeneratedEnergyMicroWh": {
    "time": "2024-08-21T22:24:32Z",
    "value": 761502200000
  }
}
```

<br />

**Battery Voltage (non-EV)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "batteryMilliVolts": {
    "time": "2024-08-28T20:40:38Z",
    "value": 11694
  }
}
```

<br />

***

### Exhaust Measures

**DEF Level**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "defLevelMilliPercent": {
    "time": "2024-08-21T22:23:15Z",
    "value": 67200
  }
}
```

<br />

***

### Fault Codes

**Fault Codes**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "faultCodes": {
    "canBusType": "CANBUS_CAN1_J1939_9PIN_PINS_C_D",
    "j1939": {
      "checkEngineLights": {
        "emissionsIsOn": true,
        "protectIsOn": false,
        "stopIsOn": false,
        "warningIsOn": false
      },
      "diagnosticTroubleCodes": [
        {
          "fmiDescription": "Data Drifted High",
          "fmiId": 20,
          "milStatus": 1,
          "occurrenceCount": 100,
          "sourceAddressName": "Engine #1",
          "spnDescription": "Automatic Gear Shifting Enable Switch",
          "spnId": 1666,
          "txId": 0
        },
        {
          "fmiDescription": "Low—most severe",
          "fmiId": 1,
          "milStatus": 0,
          "occurrenceCount": 50,
          "sourceAddressName": "Suspension - Drive Axle #1",
          "spnDescription": "Aux Valve 0 Retract Port Measured Flow",
          "spnId": 1900,
          "txId": 21
        }
      ]
    },
    "time": "2024-08-21T19:37:12Z"
  }
}
```

<br />

***

### Fuel Levels

**Fuel Levels**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "fuelPercents": {
    "time": "2024-08-21T22:24:24Z",
    "value": 6
  }
}
```

<br />

***

### Odometer

**Odometer meters (OBD)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "obdOdometerMeters": {
    "time": "2024-08-21T22:24:32Z",
    "value": 2482355
  }
}
```

<br />

**Odometer meters (GPS)**

```
```

<br />

***

### Seatbelt Statuses

**Seatbelt Statuses**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "seatbeltDriver": {
    "time": "2024-08-21T22:24:32Z",
    "value": "Unbuckled"
  }
}
```

<br />

***

### Speed

**Speed MPH (ECU)**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "ecuSpeedMph": {
    "time": "2024-08-21T22:24:32Z",
    "value": 0
  }
}
```

<br />

***

### Spreader Diagnostics

**Spreader Active**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderActive": {
    "time": "2024-08-15T20:07:16Z",
    "value": "On"
  }
}
```

<br />

**Spreader Air Temp**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderAirTemp": {
    "time": "2024-08-16T19:42:02Z",
    "value": 0
  }
}
```

<br />

**Spreader Blast State**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderBlastState": {
    "time": "2024-08-16T19:42:03Z",
    "value": "Off"
  }
}
```

<br />

**Spreader Granular Name**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderGranularRate": {
    "time": "2024-08-16T19:42:03Z",
    "value": 0
  }
}
```

<br />

**Spreader Liquid Name**

**Spreader Liquid Rate**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderLiquidRate": {
    "time": "2024-08-15T20:10:58Z",
    "value": 0
  }
}
```

<br />

**Spreader On State**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderOnState": {
    "time": "2024-08-28T20:55:59Z",
    "value": "On"
  }
}
```

<br />

**Spreader Plow Status**

**Spreader Prewet Name**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderPrewetName": {
    "time": "2024-08-15T20:07:01Z",
    "value": "PWT"
  }
}
```

<br />

**Spreader Prewet Rate**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderPrewetRate": {
    "time": "2024-08-15T20:10:58Z",
    "value": 28
  }
}
```

<br />

***

### Temperatures

**Spreader Road Temp**

```
{
  "vehicle": {
    "id": "281474991840886"
  },
  "spreaderRoadTemp": {
    "time": "2024-08-16T19:42:02Z",
    "value": 0
  }
}
```

<br />

***

## Driver Compliance

**HOS Clocks**

```
    {
      "clocks": {
        "break": {
          "timeUntilBreakDurationMs": 28800000
        },
        "cycle": {
          "cycleRemainingDurationMs": 252000000,
          "cycleStartedAtTime": "2020-01-27T07:06:25Z",
          "cycleTomorrowDurationMs": 252000000
        },
        "drive": {
          "driveRemainingDurationMs": 39600000
        },
        "shift": {
          "shiftRemainingDurationMs": 50400000
        }
      },
      "currentDutyStatus": {
        "hosStatusType": "offDuty"
      },
      "currentVehicle": {
        "ExternalIds": {
          "maintenanceId": "250020",
          "payrollId": "ABFS18600"
        },
        "id": "123456789",
        "name": "Midwest Truck #4"
      },
      "driver": {
        "id": "88668",
        "name": "Susan Bob"
      },
      "violations": {
        "cycleViolationDurationMs": 39600000,
        "shiftDrivingViolationDurationMs": 39600000
      }
    }
  }
```

<br />

***

## Events

### Address

**Address Created**

```
"entityType": "addressCreated",
"data":
{
    "eventId": "017db07f-6e95-470e-8cc0-a371f9deed2b",
    "eventTime": "1970-01-20T06:39:05.683Z",
    "eventType": "AddressCreated",
    "orgId": 20936,
    "webhookId": "1411751028848270",
    "data": {
        "address": {
            "addressTypes": [
                "yard"
            ],
            "contacts": [
                {
                    "firstName": "Michael",
                    "id": "312312",
                    "lastName": "Johnson"
                },
                {
                    "firstName": "Michael",
                    "id": "312312",
                    "lastName": "Johnson"
                },
                {
                    "firstName": "Michael",
                    "id": "312312",
                    "lastName": "Johnson"
                }
            ],
            "createdAtTime": "2021-08-30T19:36:05+00:00",
            "externalIds": {
                "siteId": "54"
            },
            "formattedAddress": "298 Burnley St",
            "geofence": {
                "circle": {
                    "latitude": 37.7749,
                    "longitude": 137.7749,
                    "radiusMeters": 23
                },
                "polygon": {
                    "vertices": [
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        },
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        }
                    ]
                },
                "settings": {
                    "showAddresses": [
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        },
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        },
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        },
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        }
                    ]
                }
            },
            "id": "494123",
            "latitude": 37.7749,
            "longitude": 122.4194,
            "name": "Company Office #1",
            "notes": "This address is located at site 892.",
            "tags": [
                {
                    "id": "3914",
                    "name": "East Coast",
                    "parentTagId": "4815"
                },
                {
                    "id": "3914",
                    "name": "East Coast",
                    "parentTagId": "4815"
                }
            ]
        }
    }
}
```

**Address Deleted**

```
"entityType": "addressDeleted",
"data":
{
    "eventId": "017db07f-6e95-470e-8cc0-a371f9deed2b",
    "eventTime": "1970-01-20T06:39:05.683Z",
    "eventType": "AddressDeleted",
    "orgId": 20936,
    "webhookId": "1411751028848270",
    "data": {
        "address": {
            "externalIds": {
                "siteId": "54"
            },
            "id": "494123",
            "name": "Company Office #1"
        }
    }
}
```

**Address Updated**

```
"entityType": "addressUpdated",
"data":
{
    "eventId": "017db07f-6e95-470e-8cc0-a371f9deed2b",
    "eventTime": "1970-01-20T06:39:05.683Z",
    "eventType": "AddressUpdated",
    "orgId": 20936,
    "webhookId": "1411751028848270",
    "data": {
        "address": {
            "addressTypes": [
                "yard"
            ],
            "contacts": [
                {
                    "firstName": "Michael",
                    "id": "312312",
                    "lastName": "Johnson"
                },
                {
                    "firstName": "Michael",
                    "id": "312312",
                    "lastName": "Johnson"
                },
                {
                    "firstName": "Michael",
                    "id": "312312",
                    "lastName": "Johnson"
                }
            ],
            "createdAtTime": "2021-08-30T19:36:05+00:00",
            "externalIds": {
                "siteId": "54"
            },
            "formattedAddress": "298 Burnley St",
            "geofence": {
                "circle": {
                    "latitude": 37.7749,
                    "longitude": 137.7749,
                    "radiusMeters": 23
                },
                "polygon": {
                    "vertices": [
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        },
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        }
                    ]
                },
                "settings": {
                    "showAddresses": [
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        },
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        },
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        },
                        {
                            "latitude": 37.7749,
                            "longitude": 137.7749
                        }
                    ]
                }
            },
            "id": "494123",
            "latitude": 37.7749,
            "longitude": 122.4194,
            "name": "Company Office #1",
            "notes": "This address is located at site 892.",
            "tags": [
                {
                    "id": "3914",
                    "name": "East Coast",
                    "parentTagId": "4815"
                },
                {
                    "id": "3914",
                    "name": "East Coast",
                    "parentTagId": "4815"
                }
            ]
        }
    }
}
```

***

### Driver

**Driver Document Submitted**

```
"entityType": "driverDocumentSubmitted",
"data":
{
  "document": {
    "createdAtTime": "2024-08-28T19:29:45.000Z",
    "documentType": {
      "id": "2c541bb5-d033-4a8e-9d53-f3db85d366ff",
      "name": "Bill of Lading"
    },
    "driver": {
      "id": "51732619",
      "name": "test driver"
    },
    "fields": [
      {
        "label": "Photos",
        "type": "photo",
        "value": {}
      },
      {
        "label": "Reference #",
        "type": "string",
        "value": {}
      }
    ],
    "id": "51732619_1724873385298",
    "state": "submitted",
    "updatedAtTime": "2024-08-28T19:29:45.000Z",
    "vehicle": {
      "externalIds": {
        "samsara.serial": "G7E5GM59H7"
      },
      "id": "281474991565165",
      "name": "Test G7E5-GM5-9H7"
    }
  },
  "eventType": "documentSubmitted"
}
```

**Driver Created**

```
"entityType": "driverCreated",
"data":
{
  "driver": {
    "carrierSettings": {},
    "createdAtTime": "2024-08-28T18:56:08.388Z",
    "driverActivationStatus": "active",
    "eldAdverseWeatherExemptionEnabled": false,
    "eldBigDayExemptionEnabled": false,
    "eldExempt": false,
    "eldPcEnabled": false,
    "eldYmEnabled": false,
    "id": "51899168",
    "name": "test streaming driver",
    "timezone": "America/Los_Angeles",
    "updatedAtTime": "2024-08-28T18:56:08.388Z",
    "username": "teststreamingdriver"
  },
  "eventType": "driverCreated"
}
```

**Driver Updated**

```
"entityType": "driverUpdated",
"data":
{
  "driver": {
    "carrierSettings": {},
    "createdAtTime": "2024-08-28T18:56:08.388Z",
    "driverActivationStatus": "active",
    "eldAdverseWeatherExemptionEnabled": false,
    "eldBigDayExemptionEnabled": false,
    "eldExempt": false,
    "eldPcEnabled": false,
    "eldYmEnabled": false,
    "id": "51899168",
    "name": "test streaming driver updated",
    "timezone": "America/Los_Angeles",
    "updatedAtTime": "2024-08-28T18:56:57.609Z",
    "username": "teststreamingdriver"
  },
  "eventType": "driverUpdated"
}
```

***

### Forms

**Form Submitted**

```
"entityType": "formSubmitted",
"data":
{
  "eventType": "formSubmitted",
  "form": {
    "createdAtTime": "2024-08-28T18:54:20Z",
    "fields": [
      {
        "id": "7dfc8ba4-47ca-48ff-8793-f4b41de8096b",
        "label": "submit forms?",
        "multipleChoiceValue": {
          "value": "Yes"
        },
        "note": "Test",
        "type": "multiple_choice"
      }
    ],
    "formTemplate": {
      "id": "b3a18c2f-1a6b-402c-96c1-bdb764611c40",
      "revisionId": "39140122-2f3a-49a5-b5cb-d5cb7e6a1423"
    },
    "id": "f1e68f82-76f5-4303-869c-45a37c8e6f4d",
    "location": {
      "latitude": 42.11847729042255,
      "longitude": -87.93395625558578
    },
    "status": "",
    "submittedAtTime": "2024-08-28T18:54:20Z",
    "submittedBy": {
      "id": "51732619",
      "type": "driver"
    },
    "updatedAtTime": "2024-08-28T18:54:20Z"
  }
}
```

***

### Maintenance

**DVIR Submitted**

```
"entityType": "dvirSubmitted",
"data":
{
  "dvir": {
    "authorSignature": {
      "signatoryUser": {
        "id": "51732619",
        "name": "test driver"
      },
      "signedAtTime": "2024-08-28T18:52:49.000Z",
      "type": "driver"
    },
    "driver": {
      "id": "51732619",
      "name": "test driver"
    },
    "endTime": "2024-08-28T18:52:49.000Z",
    "formattedLocation": "Vancouver – Blaine Highway, Surrey, BC, V3S 9N7",
    "hasDefects": false,
    "id": "624372548",
    "needsCorrection": false,
    "safetyStatus": "safe",
    "startTime": "2024-08-28T18:52:42.086Z",
    "type": "postTrip",
    "vehicle": {
      "externalIds": {
        "samsara.serial": "G7E5GM59H7"
      },
      "gateway": {
        "serial": "G7E5GM59H7"
      },
      "id": "281474991565165",
      "licensePlate": "09999",
      "name": "Test G7E5-GM5-9H7"
    }
  },
  "eventType": "dvirSubmitted"
}
```

**Engine Fault On**

> 🚧
>
> Contact your Samsara account representative to enable this event for your organization.

```
"entityType": "engineFaultOn",
"data":
{
  "eventType": "engineFaultOn",
  "fault": {
    "j1939": {
      "fmi": {
        "description": "Low—most severe",
        "id": "1"
      },
      "occurrenceCount": 50,
      "spn": {
        "description": "Aux Valve 0 Retract Port Measured Flow",
        "id": "1900"
      },
      "txId": "21"
    }
  },
  "vehicle": {
    "externalIds": {
      "samsara.serial": "GYWYJ42G8E",
      "samsara.vin": "3ALACWFC5NDNB5090"
    },
    "id": "281474991840886",
    "name": "GYWY-J42-G8E"
  }
}
```

**Engine Fault Off**

> 🚧
>
> Contact your Samsara account representative to enable this event for your organization.

```
"entityType": "engineFaultOff",
"data":
{
  "eventType": "engineFaultOff",
  "fault": {
    "j1939": {
      "lamps": {
        "emissions": true
      }
    }
  },
  "vehicle": {
    "externalIds": {
      "samsara.serial": "GYWYJ42G8E",
      "samsara.vin": "3ALACWFC5NDNB5090"
    },
    "id": "281474991840886",
    "name": "GYWY-J42-G8E"
  }
}
```

***

### Location & Movement

**Geofence Entry**

```
"entityType": "geofenceEntry",
"data":
{
  "address": {
    "formattedAddress": "I-5, Blaine, WA, USA",
    "geofence": {
      "circle": {
        "latitude": 48.99867107485855,
        "longitude": -122.75289223295576,
        "radiusMeters": 322
      }
    },
    "id": "170886751",
    "name": "test Geofence"
  },
  "eventType": "geofenceEntry",
  "vehicle": {
    "assetType": "vehicle",
    "externalIds": {
      "samsara.serial": "G7E5GM59H7"
    },
    "id": "281474991565165",
    "licensePlate": "09999",
    "name": "Test G7E5-GM5-9H7"
  }
}
```

**Geofence Exit**

```
"entityType": "geofenceExit",
"data":
{
  "address": {
    "formattedAddress": "I-5, Blaine, WA, USA",
    "geofence": {
      "circle": {
        "latitude": 48.99867107485855,
        "longitude": -122.75289223295576,
        "radiusMeters": 322
      }
    },
    "id": "170886751",
    "name": "test Geofence"
  },
  "eventType": "geofenceExit",
  "vehicle": {
    "assetType": "vehicle",
    "externalIds": {
      "samsara.serial": "G7E5GM59H7"
    },
    "id": "281474991565165",
    "licensePlate": "09999",
    "name": "Test G7E5-GM5-9H7"
  }
}
```

***

### Routing

**Route Stop Arrival**

```
"entityType": "routeStopArrival",
"data":
{
  "driver": {
    "id": "51732619",
    "name": "test driver"
  },
  "eventType": "routeStopArrival",
  "operation": "stop departed",
  "route": {
    "actualRouteEndTime": "2024-08-28T18:48:36.400Z",
    "actualRouteStartTime": "2024-08-28T18:47:02.593Z",
    "id": "6009862266",
    "name": "test route",
    "scheduledRouteEndTime": "2024-08-28T18:55:00.000Z",
    "scheduledRouteStartTime": "2024-08-28T18:47:00.000Z",
    "settings": {
      "routeCompletionCondition": "arriveLastStop",
      "routeStartingCondition": "departFirstStop"
    },
    "stops": [
      {
        "actualArrivalTime": "2024-08-28T18:47:02.593Z",
        "actualDepartureTime": "2024-08-28T18:47:02.593Z",
        "id": "6066522712",
        "liveSharingUrl": "https://cloud.samsara.com/o/5005929/fleet/viewer/job/vG0yIZb6eySjP4MMoa2S",
        "name": "Wheeling, IL, USA",
        "notes": "",
        "scheduledDepartureTime": "2024-08-28T18:47:00.000Z",
        "singleUseLocation": {
          "address": "Wheeling, IL, USA",
          "latitude": 42.1391927,
          "longitude": -87.9289591
        },
        "state": "departed"
      },
      {
        "actualArrivalTime": "2024-08-28T18:48:36.400Z",
        "actualDepartureTime": "2024-08-28T18:48:36.400Z",
        "enRouteTime": "2024-08-28T18:47:02.593Z",
        "id": "6066522713",
        "liveSharingUrl": "https://cloud.samsara.com/o/5005929/fleet/viewer/job/ymbM5oebsE3Ng0hHDG66",
        "name": "Buffalo Grove, IL, USA",
        "notes": "test notes",
        "scheduledArrivalTime": "2024-08-28T18:55:00.000Z",
        "singleUseLocation": {
          "address": "Buffalo Grove, IL, USA",
          "latitude": 42.1662831,
          "longitude": -87.9631308
        },
        "state": "departed"
      }
    ]
  },
  "routeStopDetails": {
    "actualArrivalTime": "2024-08-28T18:48:36.400Z",
    "actualDepartureTime": "2024-08-28T18:48:36.400Z",
    "enRouteTime": "2024-08-28T18:47:02.593Z",
    "id": "6066522713",
    "liveSharingUrl": "https://cloud.samsara.com/o/5005929/fleet/viewer/job/ymbM5oebsE3Ng0hHDG66",
    "state": "departed"
  },
  "time": "2024-08-28T18:48:36.400Z",
  "type": "route tracking"
}
```

**Route Stop Departure**

```
"entityType": "routeStopDeparture",
"data":
{
  "driver": {
    "id": "51732619",
    "name": "test driver"
  },
  "eventType": "routeStopDeparture",
  "operation": "stop departed",
  "route": {
    "actualRouteStartTime": "2024-08-28T18:47:02.593Z",
    "id": "6009862266",
    "name": "test route",
    "scheduledRouteEndTime": "2024-08-28T18:55:00.000Z",
    "scheduledRouteStartTime": "2024-08-28T18:47:00.000Z",
    "settings": {
      "routeCompletionCondition": "arriveLastStop",
      "routeStartingCondition": "departFirstStop"
    },
    "stops": [
      {
        "actualArrivalTime": "2024-08-28T18:47:02.593Z",
        "actualDepartureTime": "2024-08-28T18:47:02.593Z",
        "id": "6066522712",
        "liveSharingUrl": "https://cloud.samsara.com/o/5005929/fleet/viewer/job/vG0yIZb6eySjP4MMoa2S",
        "name": "Wheeling, IL, USA",
        "notes": "",
        "scheduledDepartureTime": "2024-08-28T18:47:00.000Z",
        "singleUseLocation": {
          "address": "Wheeling, IL, USA",
          "latitude": 42.1391927,
          "longitude": -87.9289591
        },
        "state": "departed"
      },
      {
        "enRouteTime": "2024-08-28T18:47:02.593Z",
        "eta": "2024-08-30T01:56:09.786Z",
        "id": "6066522713",
        "liveSharingUrl": "https://cloud.samsara.com/o/5005929/fleet/viewer/job/ymbM5oebsE3Ng0hHDG66",
        "name": "Buffalo Grove, IL, USA",
        "notes": "test notes",
        "scheduledArrivalTime": "2024-08-28T18:55:00.000Z",
        "singleUseLocation": {
          "address": "Buffalo Grove, IL, USA",
          "latitude": 42.1662831,
          "longitude": -87.9631308
        },
        "state": "en route"
      }
    ]
  },
  "routeStopDetails": {
    "actualArrivalTime": "2024-08-28T18:47:02.593Z",
    "actualDepartureTime": "2024-08-28T18:47:02.593Z",
    "id": "6066522712",
    "liveSharingUrl": "https://cloud.samsara.com/o/5005929/fleet/viewer/job/vG0yIZb6eySjP4MMoa2S",
    "state": "departed"
  },
  "time": "2024-08-28T18:47:02.593Z",
  "type": "route tracking"
}
```

***

### Safety

**Severe Speeding Started**

```
"entityType": "severeSpeedingStarted",
"data":
{
  "data": {
    "startTime": "2024-08-23T17:25:53.101Z",
    "tripStartTime": "2024-08-23T17:25:53.101Z",
    "vehicle": {
      "id": "281474991565165"
    }
  },
  "eventType": "severeSpeedingStarted"
}
```

**Severe Speeding Ended**

```
"entityType": "severeSpeedingEnded",
"data":
{
  "data": {
    "endTime": "2024-08-28T18:37:52.834Z",
    "startTime": "2024-08-28T18:36:07.713Z",
    "tripStartTime": "2024-08-28T18:35:52.027Z",
    "vehicle": {
      "id": "281474991565165"
    }
  },
  "eventType": "severeSpeedingEnded"
}
```

***

### Vehicle

**Vehicle Created**

```
{
    "eventId": "017db07f-6e95-470e-8cc0-a371f9deed2b",
    "eventTime": "1970-01-20T06:39:05.683Z",
    "eventType": "VehicleCreated",
    "orgId": 20936,
    "webhookId": "1411751028848270",
    "data": {
        "vehicle": {
            "assetType": "vehicle",
            "externalIds": {
                "maintenanceId": "250020"
            },
            "gateway": {
                "serial": "GFRV-43N-VGX"
            },
            "id": "494123",
            "licensePlate": "6SAM123",
            "name": "Fleet Truck #1",
            "vehicleVin": "1GBJ6P1B2HV112765"
        }
    }
}
```

**Vehicle Updated**

```
{
  "eventType": "vehicleUpdated",
  "vehicle": {
    "createdAtTime": "",
    "externalIds": {
      "samsara.serial": "G7E5GM59H7"
    },
    "gateway": {
      "model": "VG54NA",
      "serial": "G7E5-GM5-9H7"
    },
    "harshAccelerationSettingType": "automatic",
    "id": "281474991565165",
    "licensePlate": "09999",
    "model": "VG54NA",
    "name": "Test G7E5-GM5-9H7",
    "serial": "G7E5-GM5-9H7",
    "staticAssignedDriver": {
      "id": "51732619",
      "name": "test driver"
    },
    "vehicleRegulationMode": "regulated"
  }
}
```

***

## Data Streaming Parameters

- **Date Entities** - Select among dozens of **data entities** detailed below. Each entity can be streamed to a designated Kafka **topic** in your **connected cluster**. For each stream subscription, a unique **message** is produced in the Kafka topic with the data payload for the specific entity. For more information about setting up Samsara's Kafka Producer see our [Product Guide](https://kb.samsara.com/hc/en-us/articles/22060382956429--Beta-Kafka-Connector).
- **Data Granularity** - Data is streamed as it is updated on the Samsara cloud. Exact data granularity depends on the specific entity. For example, when a platform [event](https://developers.samsara.com/docs/kafka-connector#events) occurs a message payload is emitted to the designated Kafka topic in real-time. For diagnostic data, please consult this [reference](https://developers.samsara.com/docs/telematics#diagnostic-types) for data update frequencies. Note that GPS data updates every 5 seconds when the vehicle is on, and every 5 minutes when the vehicle is off or idle.

Each stream subscription enabled will send messages for one (1) entity to the designated Kafka topic. Entities are not bundled into the same message payload today.

> 📘 Feedback requested
>
> As you set up stream subscriptions for the available data entities, **please share your feedback with your Samsara representatives.** We want to hear where you encounter any friction in the setup process or with streaming, or any other feedback you may have.

## Data Resilience

If Samsara is ever unable to reach your Kafka cluster (i.e. an outage on your side) our Kafka streaming feature has data resilience built in.

- All time-series entities (e.g. Asset Diagnostics) will recover up to 6 hours of data. If the connected cluster is down, we will retry the connection periodically to backfill up to 6 hours.
- Platform events (see above) cannot be backfilled today, however if your connected cluster is down we will retry following the same process as for [webhooks](https://developers.samsara.com/docs/webhooks#return-a-2xx-status-code-quickly).

We don't expect Samsara's service to go down (learn more about our uptime [here](https://www.samsara.com/legal/hosted-software-sla)) but in the event that happens no data is lost: the stream subscription will pickup from the last streamed datapoint, until it's caught back up to current data.

## Message Schema Versioning

Message schema version is fixed at the time the stream is created. Like with our API and Webhooks, users of data streaming can assume there will be no [breaking changes](https://developers.samsara.com/docs/versioning#backwards-incompatible-changes) to subscription payloads.