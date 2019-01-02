Feature: Test CPRMS-IQUIT Web services

Background:
* url 'https://internet-cprms-uat.hpb.gov.sg:5556/IQuitParticipantService/ParticipantService.svc'
#* url 'https://internet-cprms-uat.hpb.gov.sg:5556/IQuitParticipantService/ParticipantService.svc?singleWsdl'

Scenario: Test 1 - Create Particpant Pass

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:iqu="http://schemas.datacontract.org/2004/07/IQuitParticipantService">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:CreateParticipant>
         <!--Optional:-->
         <tem:newParticipantData>
            <!--Optional:-->
            <iqu:ParticipantEmail>testuser@ncs.com</iqu:ParticipantEmail>
            <!--Optional:-->
            <iqu:ParticipantFullName>Test User Full Name</iqu:ParticipantFullName>
            <!--Optional:-->
            <iqu:ParticipantMobile>7788994455</iqu:ParticipantMobile>
            <!--Optional:-->
            <iqu:ParticipantNRIC>S2234567G</iqu:ParticipantNRIC>
            <!--Optional:-->
            <iqu:SupporterMobile>8899665544</iqu:SupporterMobile>
            <!--Optional:-->
            <iqu:SupporterName>Test Supporter Name</iqu:SupporterName>
         </tem:newParticipantData>
      </tem:CreateParticipant>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/CreateParticipant'
Then status 200

Scenario: Test 2 - Create Particpant Fail

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:iqu="http://schemas.datacontract.org/2004/07/IQuitParticipantService">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:CreateParticipant>
         <!--Optional:-->
         <tem:newParticipantData>
            <!--Optional:-->
            <iqu:ParticipantEmail>testuser@ncs.com</iqu:ParticipantEmail>
            <!--Optional:-->
            <iqu:ParticipantFullName>Test User Full Name</iqu:ParticipantFullName>
            <!--Optional:-->
            <iqu:ParticipantMobile></iqu:ParticipantMobile>
            <!--Optional:-->
            <iqu:ParticipantNRIC></iqu:ParticipantNRIC>
            <!--Optional:-->
            <iqu:SupporterMobile></iqu:SupporterMobile>
            <!--Optional:-->
            <iqu:SupporterName></iqu:SupporterName>
         </tem:newParticipantData>
      </tem:CreateParticipant>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/CreateParticipant'
Then status 501


Scenario: Test 3 - Update Particpant Pass

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:iqu="http://schemas.datacontract.org/2004/07/IQuitParticipantService">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:UpdateParticipant>
         <!--Optional:-->
         <tem:participantData>
            <!--Optional:-->
            <iqu:ParticipantEmail>updated_email@hotmail.com</iqu:ParticipantEmail>
            <!--Optional:-->
            <iqu:ParticipantFullName>Updated</iqu:ParticipantFullName>
            <!--Optional:-->
            <iqu:ParticipantMobile>99999999</iqu:ParticipantMobile>
            <!--Optional:-->
            <iqu:ReferenceId>d9d72c72-3fc0-45f4-9c74-14be8ecea897</iqu:ReferenceId>
            <!--Optional:-->
            <iqu:SupporterMobile>88888888</iqu:SupporterMobile>
            <!--Optional:-->
            <iqu:SupporterName>Updated Supporter</iqu:SupporterName>
         </tem:participantData>
      </tem:UpdateParticipant>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/GetParticipants'
Then status 200


Scenario: Test 4 - Update Particpant Fail

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:iqu="http://schemas.datacontract.org/2004/07/IQuitParticipantService">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:UpdateParticipant>
         <!--Optional:-->
         <tem:participantData>
            <!--Optional:-->
            <iqu:ParticipantEmail>updated_email@hotmail.com</iqu:ParticipantEmail>
            <!--Optional:-->
            <iqu:ParticipantFullName>Updated</iqu:ParticipantFullName>
            <!--Optional:-->
            <iqu:ParticipantMobile>99999999</iqu:ParticipantMobile>
            <!--Optional:-->
            <iqu:ReferenceId>d9d72c72-3fc0-45f4-9c74-14be8ecea897</iqu:ReferenceId>
            <!--Optional:-->
            <iqu:SupporterMobile>?</iqu:SupporterMobile>
            <!--Optional:-->
            <iqu:SupporterName>?</iqu:SupporterName>
         </tem:participantData>
      </tem:UpdateParticipant>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/GetParticipants'
Then status 501

Scenario: Test 5 - Get Particpants Pass

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:arr="http://schemas.microsoft.com/2003/10/Serialization/Arrays">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:GetParticipants>
         <!--Optional:-->
         <tem:lstReferenceId>
            <!--Zero or more repetitions:-->
            <arr:string>d9d72c72-3fc0-45f4-9c74-14be8ecea897</arr:string>
         </tem:lstReferenceId>
      </tem:GetParticipants>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/GetParticipants'
Then status 200

Scenario: Test 6 - Get Particpants No input

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:arr="http://schemas.microsoft.com/2003/10/Serialization/Arrays">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:GetParticipants>
         <!--Optional:-->
         <tem:lstReferenceId>
            <!--Zero or more repetitions:-->
            <arr:string></arr:string>
         </tem:lstReferenceId>
      </tem:GetParticipants>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/GetParticipants'
Then status 501


Scenario: Test 7 - Get Particpants No such participant

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:arr="http://schemas.microsoft.com/2003/10/Serialization/Arrays">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:GetParticipants>
         <!--Optional:-->
         <tem:lstReferenceId>
            <!--Zero or more repetitions:-->
            <arr:string>d9d72c72-3fc0-45f4-9999-14be8ecea897</arr:string>
         </tem:lstReferenceId>
      </tem:GetParticipants>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/GetParticipants'
Then status 502

Scenario: Test 8 - Get Particpants valid in valid not in and invalid

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:arr="http://schemas.microsoft.com/2003/10/Serialization/Arrays">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:GetParticipants>
         <!--Optional:-->
         <tem:lstReferenceId>
            <!--Zero or more repetitions:-->
            <arr:string>d9d72c72-3fc0-45f4-9c74-14be8ecea897, d9d72c72-3fc0-9999-9999-14be8ecea897,aaaa</arr:string>
         </tem:lstReferenceId>
      </tem:GetParticipants>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/GetParticipants'
Then status 502


Scenario: Test 11 - Get Particpants valid in valid not in

Given request
"""
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/" xmlns:arr="http://schemas.microsoft.com/2003/10/Serialization/Arrays">
   <soapenv:Header/>
   <soapenv:Body>
      <tem:GetParticipants>
         <!--Optional:-->
         <tem:lstReferenceId>
            <!--Zero or more repetitions:-->
            <arr:string>d9d72c72-3fc0-45f4-9c74-14be8ecea897, d9d72c72-3fc0-9999-9999-14be8ecea897</arr:string>
         </tem:lstReferenceId>
      </tem:GetParticipants>
   </soapenv:Body>
</soapenv:Envelope>
"""
When soap action 'http://tempuri.org/IParticipantService/GetParticipants'
Then status 201