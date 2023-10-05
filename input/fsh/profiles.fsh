CodeSystem: SPMSidentifierTypeCS
Id:         spms-identifierType-cs
Title:     "Code system para o tipo de identificador do profissional de saúde"
Description:  "Code system para o tipo de identificador do profissional de saúde"

* #NUTR-PT
    "nutricionista"
    "nutricionista"

* #NATU-PT
    "Naturopata"
    "Naturopata"

* #PSY-PT
    "Psicólogo"
    "Psicólogo"

* #PTP-PT
    "Fisioterapeutas"
    "Fisioterapeutas"

* #FM-PT
    "Físico Médico"
    "Físico Médico"

* #ASOC-PT
    "Assistente Social"
    "Assistente Social"

* #LTA-PT
    "Técnico de análises clínicas e de saúde pública"
    "Técnico de análises clínicas e de saúde pública"

* #APT-PT
    "Técnico de anatomia patológica, citológica e tanatológica"
    "Técnico de anatomia patológica, citológica e tanatológica"

* #AT-PT
    "Técnico de audiologia "
    "Técnico de audiologia "

* #CARDT-PT
    "Técnico de cardiopneumologia"
    "Técnico de cardiopneumologia"

* #PHART-PT
    "Técnico de farmácia"
    "Técnico de farmácia"

* #TCM-PT
    "Especialista em medicina tradicional chinesa"
    "Especialista em medicina tradicional chinesa"

* #ACUNP-PT
    "Acupuntor"
    "Acupuntor"

* #PHYTT-PT
    "Fitoterapeuta"
    "Fitoterapeuta"

* #HOMEP-PT
    "Homeopata"
    "Homeopata"

* #DH-PT
    "Higienista oral"
    "Higienista oral"

* #CHIR-PT
    "Quiroprático"
    "Quiroprático"

* #DIET-PT
    "Dietista"
    "Dietista"

* #NMR-PT
    "Técnico de medicina nuclear"
    "Técnico de medicina nuclear"

* #NT-PT
    "Técnico de neurofisiologia"
    "Técnico de neurofisiologia"

* #ORT-PT
    "Ortoprotésico"
    "Ortoprotésico"

* #DT-PT
    "Técnico de prótese dentária"
    "Técnico de prótese dentária"

* #DGR-PT
    "Técnico de radiologia"
    "Técnico de radiologia"

* #TR-PT
    "Técnico de radioterapia"
    "Técnico de radioterapia"

* #SLT-PT
    "Terapeuta da fala"
    "Terapeuta da fala"


* #OCCT-PT
    "Terapeuta ocupacional"
    "Terapeuta ocupacional"


* #EHO-PT
    "Técnico de saúde ambiental"
    "Técnico de saúde ambiental"

* #ODTL-PT
    "Odontologista"
    "Odontologista"


* #RCN-PT
    "Número de Identificação de Título de Residência"
    "Número de Identificação de Título de Residência"






ValueSet: SPMSidentifierTypeVS
Id: spms-identifierType-vs
Title:  "ValueSet para o tipo de identificador do profissional de saúde"
Description:  "ValueSet para o tipo de identificador do profissional de saúde"

* include codes from system SPMSidentifierTypeCS
* http://terminology.hl7.org/CodeSystem/v2-0203#PPN  "Passport Number"
* http://terminology.hl7.org/CodeSystem/v2-0203#NPI  "National Provider Identifier"
* http://terminology.hl7.org/CodeSystem/v2-0203#SS  "Social Security Number"
* http://terminology.hl7.org/CodeSystem/v2-0203#TAX  "Tax ID Number"
* http://terminology.hl7.org/CodeSystem/v2-0203#CZ  "Citizenship Card"
* http://terminology.hl7.org/CodeSystem/v2-0203#LN  "License number"
* http://terminology.hl7.org/CodeSystem/v2-0203#OD  "Optometrist Practitioner Number"
* http://terminology.hl7.org/CodeSystem/v2-0203#DO  "Osteopath Practitioner Number"
* http://terminology.hl7.org/CodeSystem/v2-0203#EI  "Employee number"
* http://terminology.hl7.org/CodeSystem/v2-0203#DPM  "Podiatrist license number"
* http://terminology.hl7.org/CodeSystem/v2-0203#DDS  "Dentist license number"
* http://terminology.hl7.org/CodeSystem/v2-0203#RPH  "Pharmacist licence Number"
* http://terminology.hl7.org/CodeSystem/v2-0203#RN  "Registered Nurse Number"
* http://terminology.hl7.org/CodeSystem/v2-0203#MD  "Medical License number"


Profile:     PTPractitionerIdentifier
Id:          pt-practitioner-identifier
Parent:      Identifier
Title:       "Perfil Profissional de sáude PT"
Description:   "Perfil Profissional de sáude PT"

* type.coding from spms-identifierType-vs (required)
* value 1..1 MS

Extension: NationalityPractitioner
Id:        nationality-practitioner
Title:     "Extension nationality-practitioner"
Description: "Extension nationality-practitioner"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/nationality-practitioner"



Extension: SpmsCounty
Id:        spms-county
Title:     "Extension county"
Description: "Extension county"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/county"




Extension: Indicative
Id:        indicative
Title:     "Extension indicative"
Description: "Extension indicative"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/indicative"


Extension: InactivePractitioner
Id:       inactive-practitioner
Title:     "Extension inactive-practitioner"
Description: "Extension inactive-practitioner"
* value[x] only Period
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/inactive-practitioner"



Extension: AddressType
Id:        address-type
Title:    "address-type"
Description: "address-type"
* value[x] only Coding
* ^url = "Extension http://spms.min-saude.pt/fhir/iop/extensions/address-type"

Extension: Municipality
Id:        municipality
Title:    "Extension municipality"
Description: "Extension municipality"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/municipality"


Extension: Parish
Id:        parish
Title:    "Extension parish"
Description: "Extension parish"
* value[x] only CodeableConcept
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/parish"


Extension: AddressNuts
Id:        address-nuts
Title:    "Extension address-nuts"
Description: "Extension address-nuts"
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
Title:    "Extension geolocation"
Description: "Extension geolocation"
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
Title:    "Extension proficiency"
Description: "Extension proficiency"
* ^url = "http://spms.min-saude.pt/fhir/iop/extensions/proficiency"
* value[x] only CodeableConcept
* ^context.type = http://hl7.org/fhir/extension-context-type#element
* ^context.expression = "Practitioner.communication"

Extension: Qualification
Id:        qualification
Title:    "Extension qualification"
Description: "qExtension ualification"
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
Title:       "Perfil Profissional de sáude PT - ET RSE"
Description: "O recurso Practitioner caracteriza de forma abrangente um profissional de saúde. A definição transversal deste recurso permite, assim, a existência de uma visão única relativamente aos atributos que o caracterizam e que se afiguram como relevantes no âmbito da partilha de informação entre sistemas. O recurso Practitioner é utilizado para descrever um indivíduo que está direta ou indiretamente envolvido na prestação de cuidados de saúde. "

* identifier only PTPractitionerIdentifier



* active ^short = "Indica se o profissional se encontra ativo ou inativo"

* address.extension contains 
    AddressNuts named address-nuts 0..1 MS and
    Geolocation named geolocation 0..1 MS and
    Parish named parish 0..1 MS and
    SpmsCounty named county 0..1 MS and 
    Municipality named municipality 0..1 MS and 
    AddressType named address-type 0..1 MS

* telecom.extension contains
    Indicative named indicative 0..1 MS 

* extension contains
    InactivePractitioner named inactive-practitioner 0..1 MS and
    NationalityPractitioner named nationality-practitioner 0..1 MS 


* qualification.extension contains 
    Qualification named qualification 0..*
* communication.extension contains
   Proficiency named proficiency 0..1