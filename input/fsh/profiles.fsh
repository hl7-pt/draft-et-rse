
Extension: NationalityPractitioner
Id:        nationality-practitioner
Title:     "nationality-practitioner"
Description: "nationality-practitioner"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/nationality-practitioner"



Extension: SpmsCountry
Id:        spms-country
Title:     "spms-country"
Description: "spms-country"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/county"




Extension: Indicative
Id:        indicative
Title:     "indicative"
Description: "indicative"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/indicative"


Extension: InactivePractitioner
Id:       inactive-practitioner
Title:     "inactive-practitioner"
Description: "inactive-practitioner"
* value[x] only Period
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/inactive-practitioner"



Extension: AddressType
Id:        address-type
Title:    "address-type"
Description: "address-type"
* value[x] only Coding
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/address-type"

Extension: Municipality
Id:        municipality
Title:    "municipality"
Description: "municipality"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/municipality"


Extension: Parish
Id:        parish
Title:    "parish"
Description: "parish"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/parish"


Extension: AddressNuts
Id:        address-nuts
Title:    "address-nuts"
Description: "address-nuts"
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/address-nuts"
* extension contains
    nuts-I 1..1 MS and
    nuts-II 1..1 MS and
    nuts-III 1..1 MS
* extension[nuts-I].value[x] only CodeableConcept
* extension[nuts-II].value[x] only CodeableConcept
* extension[nuts-III].value[x] only CodeableConcept


Extension: Geolocation
Id:        geolocation
Title:    "geolocation"
Description: "geolocation"
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/geolocation"
* extension contains
    longitude 1..1 MS and
    latitude 1..1 MS and
    altitude 1..1 MS
* extension[longitude].value[x] only decimal
* extension[latitude].value[x] only decimal
* extension[altitude].value[x] only decimal



Extension: Proficiency
Id:        proficiency
Title:    "proficiency"
Description: "proficiency"
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/proficiency"
* value[x] only CodeableConcept
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Practitioner.communication"

Extension: Qualification
Id:        qualification
Title:    "qualification"
Description: "qualification"
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/qualification"
* extension contains
    status 1..1 MS and
    start-date 1..1 MS and
    suspension-period 1..1 MS
* extension[status].value[x] only CodeableConcept
* extension[start-date].value[x] only Period
* extension[suspension-period].value[x] only Period

Profile:     MedicoIdentifier
Id:          MedicoIdentifier
Parent:      Identifier
Title:       "Example identifier md Profile"
Description: "Example of a identifier md Profile"

* type.coding = http://terminology.hl7.org/CodeSystem/v2-0203#MD  "Medical License number"
* value 1..1
* type.text ^short = "Número da Cédula Profissional Médica"
* value ^short = "<numero-da-cedula-profissional-do-medico>"
* system ^short = "<url para o sistema de codificação respetivo>"
* use ^short = "<identifier-use>"


Profile:     EnfermeiroIdentifier
Id:          enfermeiroIdentifier
Parent:      Identifier
Title:       "Example identifier nurse Profile"
Description: "Example of a identifier nurse Profile"

* type.coding = http://terminology.hl7.org/CodeSystem/v2-0203#RN  "Registered Nurse Number"
* value 1..1
* type.text ^short = "Número da Cédula Profissional de enfermagem"
* value ^short = "<numero-da-cedula-profissional-do-enfermeiro>"
* system ^short = "<url para o sistema de codificação respetivo>"
* use ^short = "<identifier-use>"


Profile:     FarmaceuticoIdentifier
Id:          farmaceuticoIdentifier
Parent:      Identifier
Title:       "identifier pharma Profile"
Description: "identifier pharma Profile"

* type.coding = http://terminology.hl7.org/CodeSystem/v2-0203#RPH  "Pharmacist licence Number"
* value 1..1
* type.text ^short = "Número da Cédula Profissional farmacêutica"
* value ^short = "<numero-da-cedula-profissional-do-farmaceutico>"
* system ^short = "<url para o sistema de codificação respetivo>"
* use ^short = "<identifier-use>"



Profile:     DietistaIdentifier
Id:          dietistaIdentifier
Parent:      Identifier
Title:       "identifier diet Profile"
Description: "identifier diet Profile"
//* identifier[dietista].type.coding = MeaningOrderCS#DIET-PT   "Dietitian Practitioner Number"
* value 1..1
* type.text ^short = "Número da Cédula Profissional dietista"
* value ^short = "<numero-da-cedula-profissional>"
* system ^short = "<url para o sistema de codificação respetivo>"
* use ^short = "<identifier-use>"



Profile:     ETPractitioner
Id:          ETPractitioner
Parent:      Practitioner
Title:       "Example Practitioner Profile"
Description: "Example of a Practitioner Profile"

//falta o resto dos profissionais de saúde

* identifier only MedicoIdentifier or DietistaIdentifier or FarmaceuticoIdentifier or EnfermeiroIdentifier 
* identifier 0..1 MS


* active ^short = "Indica se o profissional se encontra ativo ou inativo"

* address.extension contains 
    AddressNuts named address-nuts 0..1 MS and
    Geolocation named geolocation 0..1 MS and
    Parish named parish 0..1 MS and
    SpmsCountry named country 0..1 MS and 
    Municipality named municipality 0..1 MS and 
    AddressType named address-type 0..1 MS

* telecom.extension contains
    Indicative named indicative 0..1 MS 

* extension contains
    InactivePractitioner named inactive-practitioner 0..1 MS and
    NationalityPractitioner named nationality-practitioner 0..1 MS 

* qualification 1..1 MS
* qualification.code 1..1 MS
* qualification.extension contains 
    Qualification named qualification 0..*
* communication.extension contains
   Proficiency named proficiency 0..1