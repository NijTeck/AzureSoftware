targetScope='resourceGroup'

resource symbolicname 'Microsoft.Compute/virtualMachines@2021-11-01' = {
  name: 'string'
  location: 'usgovvirginia'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  extendedLocation: {
    name: 'string'
    type: 'EdgeZone'
  }
  identity: {
    type: 'string'
    userAssignedIdentities: {}
  }
  plan: {
    name: 'string'
    product: 'string'
    promotionCode: 'string'
    publisher: 'string'
  }
  properties: {
    additionalCapabilities: {
      hibernationEnabled: true
      ultraSSDEnabled: false
    }
    applicationProfile: {
      galleryApplications: [
        {
          configurationReference: 'string'
          order: 'int'
          packageReferenceId: 'string'
          tags: 'string'
        }
      ]
    }
    availabilitySet: {
      id: 'string'
    }
    billingProfile: {
      maxPrice: 'int'
    }
    capacityReservation: {
      capacityReservationGroup: {
        id: 'string'
      }
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: 'string'
      }
    }
    evictionPolicy: 'string'
    extensionsTimeBudget: 'string'
    hardwareProfile: {
      vmSize: 'string'
      vmSizeProperties: {
        vCPUsAvailable: 'int'
        vCPUsPerCore: 'int'
      }
    }
    host: {
      id: 'string'
    }
    hostGroup: {
      id: 'string'
    }
    licenseType: 'string'
    networkProfile: {
      networkApiVersion: '2020-11-01'
      networknterfaceConfigurations: [
        {
          name: 'string'
          properties: {
            deleteOption: 'string'
            dnsSettings: {
              dnsServers: [
                'string'
              ]
            }
            dscpConfiguration: {
              id: 'string'
            }
            enableAcceleratedNetworking: true
            enableFpga: true
            enableIPForwarding: true
            ipConfigurations: [
              {
                name: 'string'
                properties: {
                  applicationGatewayBackendAddressPools: [
                    {
                      id: 'string'
                    }
                  ]
                  applicationSecurityGroups: [
                    {
                      id: 'string'
                    }
                  ]
                  loadBalancerBackendAddressPools: [
                    {
                      id: 'string'
                    }
                  ]
                  primary: true
                  privateIPAddressVersion: 'string'
                  publicIPAddressConfiguration: {
                    name: 'string'
                    properties: {
                      deleteOption: 'string'
                      dnsSettings: {
                        domainNameLabel: 'string'
                      }
                      idleTimeoutInMinutes: 'int'
                      ipTags: [
                        {
                          ipTagType: 'string'
                          tag: 'string'
                        }
                      ]
                      publicIPAddressVersion: 'string'
                      publicIPAllocationMethod: 'string'
                      publicIPPrefix: {
                        id: 'string'
                      }
                    }
                    sku: {
                      name: 'string'
                      tier: 'string'
                    }
                  }
                  subnet: {
                    id: 'string'
                  }
                }
              }
            ]
            networkSecurityGroup: {
              id: 'string'
            }
            primary: true
          }
        }
      ]
      networkinterfaces: [
        {
          id: 'string'
          properties: {
            deleteOption: 'string'
            primary: true
          }
        }
      ]
    }
    osProfile: {
      adminPassword: 'Bilon555'
      adminUsername: 'leonardesere'
      allowExtensionOperations: true
      computerName: 'string'
      customData: 'string'
      linuxConfiguration: {
        disablePasswordAuthentication: true
        patchSettings: {
          assessmentMode: 'string'
          patchMode: 'string'
        }
        provisionVMAgent: true
        ssh: {
          publicKeys: [
            {
              keyData: 'string'
              path: 'string'
            }
          ]
        }
      }
      requireGuestProvisionSignal: true
      secrets: [
        {
          sourceVault: {
            id: 'string'
          }
          vaultCertificates: [
            {
              certificateStore: 'string'
              certificateUrl: 'string'
            }
          ]
        }
      ]
      windowsConfiguration: {
        additionalUnattendContent: [
          {
            componentName: 'Microsoft-Windows-Shell-Setup'
            content: 'string'
            passName: 'OobeSystem'
            settingName: 'string'
          }
        ]
        enableAutomaticUpdates: true
        patchSettings: {
          assessmentMode: 'string'
          enableHotpatching: true
          patchMode: 'string'
        }
        provisionVMAgent: true
        timeZone: 'string'
        winRM: {
          listeners: [
            {
              certificateUrl: 'string'
              protocol: 'string'
            }
          ]
        }
      }
    }
    platformFaultDomain: 'int'
    priority: 'string'
    proximityPlacementGroup: {
      id: 'string'
    }
    scheduledEventsProfile: {
      terminateNotificationProfile: {
        enable: true
        notBeforeTimeout: 'string'
      }
    }
    securityProfile: {
      encryptionAtHost: true
      securityType: 'string'
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
    }
    storageProfile: {
      dataDisks: [
        {
          createOption: 'string'
          deleteOption: 'string'
          detachOption: 'ForceDetach'
          diskSizeGB: 'int'
          image: {
            uri: 'string'
          }
          lun: 'int'
          managedDisk: {
            diskEncryptionSet: {
              id: 'string'
            }
            id: 'string'
            securityProfile: {
              diskEncryptionSet: {
                id: 'string'
              }
              securityEncryptionType: 'string'
            }
            storageAccountType: 'string'
          }
          name: 'string'
          toBeDetached: true
          vhd: {
            uri: 'string'
          }
          writeAcceleratorEnabled: true
        }
      ]
      imageReference: {
        communityGalleryImageId: 'string'
        id: 'string'
        offer: 'string'
        publisher: 'string'
        sharedGalleryImageId: 'string'
        sku: 'string'
        version: 'string'
      }
      osDisk: {
        createOption: 'string'
        deleteOption: 'string'
        diffDiskSettings: {
          option: 'Local'
          placement: 'string'
        }
        diskSizeGB: 'int'
        encryptionSettings: {
          diskEncryptionKey: {
            secretUrl: 'string'
            sourceVault: {
              id: 'string'
            }
          }
          enabled: true
          keyEncryptionKey: {
            keyUrl: 'string'
            sourceVault: {
              id: 'string'
            }
          }
        }
        image: {
          uri: 'string'
        }
        managedDisk: {
          diskEncryptionSet: {
            id: 'string'
          }
          id: 'string'
          securityProfile: {
            diskEncryptionSet: {
              id: 'string'
            }
            securityEncryptionType: 'string'
          }
          storageAccountType: 'string'
        }
        name: 'string'
        osType: 'string'
        vhd: {
          uri: 'string'
        }
        writeAcceleratorEnabled: true
      }
    }
    userData: 'string'
    virtualMachineScaleSet: {
      id: 'string'
    }
  }
  zones: [
    'string'
  ]
}
