
Extension: nationality-practitioner
Id:        nationality-practitioner
Title:     "nationality-practitioner"
Description: "nationality-practitioner"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/nationality-practitioner"

Extension: indicative
Id:        indicative
Title:     "indicative"
Description: "indicative"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/indicative"


Extension: inactive-practitioner
Id:       inactive-practitioner
Title:     "inactive-practitioner"
Description: "inactive-practitioner"
* value[x] only Period
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/inactive-practitioner"



Extension: address-type
Id:        address-type
Title:    "address-type"
Description: "address-type"
* value[x] only Coding
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/address-type"

Extension: municipality
Id:        municipality
Title:    "municipality"
Description: "municipality"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/municipality"


Extension: parish
Id:        parish
Title:    "parish"
Description: "parish"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/parish"


Extension: address-nuts
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


Extension: geolocation
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



Extension: proficiency
Id:        proficiency
Title:    "proficiency"
Description: "proficiency"
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/proficiency"
* value[x] only CodeableConcept
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Practitioner.communication"

Extension: qualification
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


Profile:     enfermeiroIdentifier
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


Profile:     farmaceuticoIdentifier
Id:          farmaceuticoIdentifier
Parent:      Identifier
Title:       "Example identifier pharma Profile"
Description: "Example of a identifier pharma Profile"

* type.coding = http://terminology.hl7.org/CodeSystem/v2-0203#RPH  "Pharmacist licence Number"
* value 1..1
* type.text ^short = "Número da Cédula Profissional farmacêutica"
* value ^short = "<numero-da-cedula-profissional-do-farmaceutico>"
* system ^short = "<url para o sistema de codificação respetivo>"
* use ^short = "<identifier-use>"



Profile:     dietistaIdentifier
Id:          dietistaIdentifier
Parent:      Identifier
Title:       "Example identifier diet Profile"
Description: "Example of a identifier diet Profile"
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

//* identifier ^slicing.discriminator.type = #value
//* identifier ^slicing.discriminator.path = "type.coding"
//* identifier ^slicing.rules = #open
//* identifier contains MedicoIdentifier 0..1 MS and  enfermeiroIdentifier 0..1 MS and farmaceuticoIdentifier 0..1 MS and dietista 0..1 MS

* identifier only MedicoIdentifier or dietistaIdentifier or farmaceuticoIdentifier or enfermeiroIdentifier 
* identifier 0..1 MS


* active ^short = "Indica se o profissional se encontra ativo ou inativo"

* address.extension contains 
    address-nuts named address-nuts 0..1 MS and
    geolocation named geolocation 0..1 MS and
    parish named parish 0..1 MS and
    country named country 0..1 MS and 
    municipality named municipality 0..1 MS and 
    address-type named address-type 0..1 MS

* telecom.extension contains
    indicative named indicative 0..1 MS 

* extension contains
    inactive-practitioner named inactive-practitioner 0..1 MS and
    nationality-practitioner named nationality-practitioner 0..1 MS 

* qualification 1..1 MS
* qualification.code 1..1 MS
* qualification.extension contains 
    qualification named qualification 0..*
* communication.extension contains
   proficiency named proficiency 0..1