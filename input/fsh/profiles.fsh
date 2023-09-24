
CodeSystem: MeaningOrderCS
Id:         lymph-node-cs
Title:     "Lymph node code system"
Description: "Lymph node terms that could not be found in standard sources such as SNOMED CT."
//* ^url = http://spms.min-saude.pt/bdnp/codesystem/med-request-modality

* #DIET-PT
"Receita sem papel"
* #RCP
"Receita com papel"


ValueSet: MeaningOrderVS
* include codes from system MeaningOrderCS



CodeSystem: IndicativeCS
Id:         indicative-cs
Title:     "Lymph node code system"
Description: "Lymph node terms that could not be found in standard sources such as SNOMED CT."
//* ^url = http://spms.min-saude.pt/bdnp/codesystem/med-request-modality

* #DIET-PT
"Receita sem papel"



ValueSet: IndicativeVS
* include codes from system IndicativeCS


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
* value[x] from IndicativeVS (required)


* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/indicative"


Extension: inactive-practitioner
Id:       inactive-practitioner
Title:     "Therapy Sessions Completed"
Description: "The number of sessions of some therapy."
* value[x] only Period
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/inactive-practitioner"



Extension: MeaningOrder
Id:        meaning-order
Title:    "MODALIDADE DE PRESCRIÇÃO"
Description: "Receita com papel (RCP) ou receita sem papel (RSP)."
* value[x] only CodeableConcept
* value[x] from MeaningOrderVS (required)
* ^url = "http://spms.min-saude/pe/top/extensions/med-request-modality"


Profile:     ExamplePatientProfile
Id:          example-patient-profile
Parent:      Practitioner
Title:       "Example Practitioner Profile"
Description: "Example of a Practitioner of Patient"

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

* identifier[dietista].type.coding = MeaningOrderCS#DIET-PT   "Dietitian Practitioner Number"
* identifier[dietista].value 1..1
* identifier[dietista].type.text ^short = "Número da Cédula Profissional dietista"
* identifier[dietista].value ^short = "<numero-da-cedula-profissional>"
* identifier[dietista].system ^short = "<url para o sistema de codificação respetivo>"
* identifier[dietista].use ^short = "<identifier-use>"

* active ^short = "Indica se o profissional se encontra ativo ou inativo"
