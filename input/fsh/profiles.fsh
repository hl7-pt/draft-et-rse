
Extension: nationality-practitioner
Id:        nationality-practitioner
Title:     "Therapy Sessions Completed"
Description: "The number of sessions of some therapy."
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/nationality-practitioner"

Extension: indicative
Id:        indicative
Title:     "Therapy Sessions Completed"
Description: "The number of sessions of some therapy."
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/indicative"


Extension: inactive-practitioner
Id:       inactive-practitioner
Title:     "Therapy Sessions Completed"
Description: "The number of sessions of some therapy."
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
Title:    "MODALIDADE DE PRESCRIÇÃO"
Description: "Receita com papel (RCP) ou receita sem papel (RSP)."
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
* ^context[+].type = #element
* ^context[=].expression = "Practitioner.communication"

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


Profile:     ETPractitioner
Id:          ETPractitioner
Parent:      Practitioner
Title:       "Example Practitioner Profile"
Description: "Example of a Practitioner Profile"

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding"
* identifier ^slicing.rules = #open
* identifier contains médico 0..1 MS and  enfermeiro 0..1 MS and farmaceutico 0..1 MS and dietista 0..1 MS

//falta o resto dos profissionais de saúde

* identifier[médico].type.coding = http://terminology.hl7.org/CodeSystem/v2-0203#MD  "Medical License number"
* identifier[médico].value 1..1
* identifier[médico].type.text ^short = "Número da Cédula Profissional Médica"
* identifier[médico].value ^short = "<numero-da-cedula-profissional-do-medico>"
* identifier[médico].system ^short = "<url para o sistema de codificação respetivo>"
* identifier[médico].use ^short = "<identifier-use>"


* identifier[enfermeiro].type.coding = http://terminology.hl7.org/CodeSystem/v2-0203#RN  "Registered Nurse Number"
* identifier[enfermeiro].value 1..1
* identifier[enfermeiro].type.text ^short = "Número da Cédula Profissional de enfermagem"
* identifier[enfermeiro].value ^short = "<numero-da-cedula-profissional-do-enfermeiro>"
* identifier[enfermeiro].system ^short = "<url para o sistema de codificação respetivo>"
* identifier[enfermeiro].use ^short = "<identifier-use>"

* identifier[farmaceutico].type.coding = http://terminology.hl7.org/CodeSystem/v2-0203#RPH  "Pharmacist licence Number"
* identifier[farmaceutico].value 1..1
* identifier[farmaceutico].type.text ^short = "Número da Cédula Profissional farmacêutica"
* identifier[farmaceutico].value ^short = "<numero-da-cedula-profissional-do-farmaceutico>"
* identifier[farmaceutico].system ^short = "<url para o sistema de codificação respetivo>"
* identifier[farmaceutico].use ^short = "<identifier-use>"

//* identifier[dietista].type.coding = MeaningOrderCS#DIET-PT   "Dietitian Practitioner Number"
* identifier[dietista].value 1..1
* identifier[dietista].type.text ^short = "Número da Cédula Profissional dietista"
* identifier[dietista].value ^short = "<numero-da-cedula-profissional>"
* identifier[dietista].system ^short = "<url para o sistema de codificação respetivo>"
* identifier[dietista].use ^short = "<identifier-use>"

* active ^short = "Indica se o profissional se encontra ativo ou inativo"

* qualification 1..1 MS
* qualification.code 1..1 MS

