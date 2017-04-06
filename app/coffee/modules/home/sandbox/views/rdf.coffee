module.exports = """
<!-- This is the FOAF formal vocabulary description, expressed using W3C RDFS and OWL markup. foaf/spec version -->
<!-- For more information about FOAF:                                            -->
<!--   see the FOAF project homepage, http://www.foaf-project.org/               -->
<!--   FOAF specification, http://xmlns.com/foaf/spec/                             -->
<!--                                                                             -->
<!-- first we introduce a number of RDF namespaces we will be using... -->
<rdf:RDF
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:vs="http://www.w3.org/2003/06/sw-vocab-status/ns#"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:wot="http://xmlns.com/wot/0.1/"
  xmlns:dc="http://purl.org/dc/elements/1.1/">
<!-- Here we describe general characteristics of the FOAF vocabulary ('ontology'). -->
  <owl:Ontology rdf:about="http://xmlns.com/foaf/0.1/" dc:title="Friend of a Friend (FOAF) vocabulary" dc:description="The Friend of a Friend (FOAF) RDF vocabulary, described using W3C RDF Schema and the Web Ontology Language." >
  </owl:Ontology>


  <!-- OWL/RDF interop section - geeks only -->
  <!--  most folk can ignore this lot. the game here is to make FOAF
    work with vanilla RDF/RDFS tools, and with the stricter OWL DL
  profile of OWL. At the moment we're in the OWL Full flavour of OWL.
  The following are tricks to try have the spec live in both worlds
  at once. See
    http://phoebus.cs.man.ac.uk:9999/OWL/Validator
    http://www.mindswap.org/2003/pellet/demo.shtml
  ...for some tools that help.          -->
  <owl:AnnotationProperty rdf:about="http://xmlns.com/wot/0.1/assurance"/>
  <owl:AnnotationProperty rdf:about="http://xmlns.com/wot/0.1/src_assurance"/>
  <owl:AnnotationProperty rdf:about="http://www.w3.org/2003/06/sw-vocab-status/ns#term_status"/>
  <!--  DC terms are NOT annotation properties in general, so we consider the following
  claims scoped to this document. They may be removed in future revisions if
  OWL tools become more flexible. -->
  <owl:AnnotationProperty rdf:about="http://purl.org/dc/elements/1.1/description"/>
  <owl:AnnotationProperty rdf:about="http://purl.org/dc/elements/1.1/title"/>
  <owl:AnnotationProperty rdf:about="http://purl.org/dc/elements/1.1/date"/>
  <owl:Class rdf:about="http://www.w3.org/2000/01/rdf-schema#Class"/>

<!--  <owl:Class rdf:about="http://www.w3.org/2000/01/rdf-schema#Resource"/>
  <owl:Class rdf:about="http://www.w3.org/2000/01/rdf-schema#Literal"/> -->
  <!-- end of OWL/RDF interop voodoo. mostly. -->

  <!-- utility class, a candidate for replacing the pattern of subproperty-ing rdfs:label -->
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/LabelProperty" vs:term_status="unstable">
    <rdfs:label>Label Property</rdfs:label>
    <rdfs:comment>A foaf:LabelProperty is any RDF property with texual values that serve as labels.</rdfs:comment>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdfs:Class>

<!-- FOAF classes (types) are listed first. -->

  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/Person" rdfs:label="Person" rdfs:comment="A person." vs:term_status="stable">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class" />
    <owl:equivalentClass rdf:resource="http://schema.org/Person" />
    <owl:equivalentClass rdf:resource="http://www.w3.org/2000/10/swap/pim/contact#Person" />
<!--    <rdfs:subClassOf><owl:Class rdf:about="http://xmlns.com/wordnet/1.6/Person"/></rdfs:subClassOf> -->
    <rdfs:subClassOf><owl:Class rdf:about="http://xmlns.com/foaf/0.1/Agent"/></rdfs:subClassOf>
<!--    <rdfs:subClassOf><owl:Class rdf:about="http://xmlns.com/wordnet/1.6/Agent"/></rdfs:subClassOf> -->
    <rdfs:subClassOf><owl:Class rdf:about="http://www.w3.org/2003/01/geo/wgs84_pos#SpatialThing" rdfs:label="Spatial Thing"/></rdfs:subClassOf>
    <!-- aside:
  are spatial things always spatially located?
  Person includes imaginary people... discuss... -->
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>

<!--    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Document"/> this was a mistake; tattoo'd people, for example. -->

    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Organization"/>
    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Project"/>
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/Document" rdfs:label="Document" rdfs:comment="A document." vs:term_status="stable">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <owl:equivalentClass rdf:resource="http://schema.org/CreativeWork" />
<!--    <rdfs:subClassOf rdf:resource="http://xmlns.com/wordnet/1.6/Document"/> -->
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Organization"/>
    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Project"/>
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/Organization" rdfs:label="Organization" rdfs:comment="An organization." vs:term_status="stable">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
<!--    <rdfs:subClassOf><owl:Class rdf:about="http://xmlns.com/wordnet/1.6/Organization"/></rdfs:subClassOf> -->
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/Group" vs:term_status="stable" rdfs:label="Group" rdfs:comment="A class of Agents.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/Agent" vs:term_status="stable" rdfs:label="Agent" rdfs:comment="An agent (eg. person, group, software or physical artifact).">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <owl:equivalentClass rdf:resource="http://purl.org/dc/terms/Agent"/>
<!--    <rdfs:subClassOf><owl:Class rdf:about="http://xmlns.com/wordnet/1.6/Agent-3"/></rdfs:subClassOf> -->
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/Project" vs:term_status="testing" rdfs:label="Project" rdfs:comment="A project (a collective endeavour of some kind).">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
<!--    <rdfs:subClassOf><owl:Class rdf:about="http://xmlns.com/wordnet/1.6/Project"/></rdfs:subClassOf> -->
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <owl:disjointWith rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
<!-- arguably a subclass of Agent; to be discussed -->
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/Image" vs:term_status="stable" rdfs:label="Image" rdfs:comment="An image.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <owl:equivalentClass rdf:resource="http://schema.org/ImageObject" />
<!--    <rdfs:subClassOf><owl:Class rdf:about="http://xmlns.com/wordnet/1.6/Document"/></rdfs:subClassOf> -->
    <rdfs:subClassOf><owl:Class rdf:about="http://xmlns.com/foaf/0.1/Document"/></rdfs:subClassOf>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdfs:Class>

  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/PersonalProfileDocument" rdfs:label="PersonalProfileDocument" rdfs:comment="A personal profile RDF document." vs:term_status="testing">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
  </rdfs:Class>

  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/OnlineAccount" vs:term_status="testing" rdfs:label="Online Account" rdfs:comment="An online account.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:subClassOf rdf:resource="http://www.w3.org/2002/07/owl#Thing" rdfs:label="Thing"/>
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/OnlineGamingAccount" vs:term_status="unstable" rdfs:label="Online Gaming Account" rdfs:comment="An online gaming account.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/OnlineAccount"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/OnlineEcommerceAccount" vs:term_status="unstable" rdfs:label="Online E-commerce Account" rdfs:comment="An online e-commerce account.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/OnlineAccount"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdfs:Class>
  <rdfs:Class rdf:about="http://xmlns.com/foaf/0.1/OnlineChatAccount" vs:term_status="unstable" rdfs:label="Online Chat Account" rdfs:comment="An online chat account.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#Class"/>
    <rdfs:subClassOf rdf:resource="http://xmlns.com/foaf/0.1/OnlineAccount"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdfs:Class>
<!-- FOAF properties (ie. relationships). -->
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/mbox" vs:term_status="stable" rdfs:label="personal mailbox" rdfs:comment="A
personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a 'static inverse functional property', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/mbox_sha1sum" vs:term_status="testing" rdfs:label="sha1sum of a personal mailbox URI name" rdfs:comment="The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>

<!--
put it back in again 2006-01-29 - see
http://chatlogs.planetrdf.com/swig/2006-01-29.html#T21-12-35
I have mailed rdfweb-dev@vapours.rdfweb.org for discussion.
Libby

Commenting out as a kindness to OWL DL users. The semantics didn't quite cover
our usage anyway, since (a) we want static-across-time, which is so beyond OWL as
to be from another planet (b) we want identity reasoning invariant across xml:lang
tagging. FOAF code will know what to do. OWL folks note, this assertion might return.

danbri
-->
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>

  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/gender" vs:term_status="testing"
rdfs:label="gender"
rdfs:comment="The gender of this Agent (typically but not necessarily 'male' or 'female').">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#FunctionalProperty"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <!-- whatever one's gender is, and we are liberal in leaving room for more options
    than 'male' and 'female', we model this so that an agent has only one gender. -->
  </rdf:Property>



  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/geekcode" vs:term_status="archaic" rdfs:label="geekcode" rdfs:comment="A textual geekcode for this person, see http://www.geekcode.com/geek.html">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/dnaChecksum" vs:term_status="archaic" rdfs:label="DNA checksum" rdfs:comment="A checksum for the DNA of some thing. Joke.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/sha1" vs:term_status="unstable" rdfs:label="sha1sum (hex)" rdfs:comment="A sha1sum hash, in hex.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
<!-- rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty" -->
<!-- IFP under discussion -->
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/based_near" vs:term_status="testing" rdfs:label="based near" rdfs:comment="A location that something is based near, for some broadly human notion of near.">
<!-- see http://esw.w3.org/topic/GeoOnion for extension  ideas -->
<!-- this was ranged as Agent... hmm -->
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2003/01/geo/wgs84_pos#SpatialThing"/>
    <rdfs:range rdf:resource="http://www.w3.org/2003/01/geo/wgs84_pos#SpatialThing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
<!-- FOAF naming properties -->
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/title" vs:term_status="testing" rdfs:label="title" rdfs:comment="Title (Mr, Mrs, Ms, Dr. etc)">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/nick" vs:term_status="testing" rdfs:label="nickname" rdfs:comment="A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
<!-- ......................... chat IDs ........................... -->
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/jabberID" vs:term_status="testing" rdfs:label="jabber ID" rdfs:comment="A jabber ID for something.">
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
<!--
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/nick"/>
...different to the other IM IDs, as Jabber has wider usage, so
we don't want the implied rdfs:domain here.

-->
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <!-- there is a case for using resources/URIs here, ... -->
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/aimChatID" vs:term_status="testing" rdfs:label="AIM chat ID" rdfs:comment="An AIM chat ID">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/nick"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
  </rdf:Property>

  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/skypeID" vs:term_status="testing" rdfs:label="Skype ID" rdfs:comment="A Skype ID">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/nick"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <!-- todo: OWL2 easy key definition -->
  </rdf:Property>

<!-- http://www.stud.uni-karlsruhe.de/~uck4/ICQ/Packet-112.html -->
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/icqChatID" vs:term_status="testing" rdfs:label="ICQ chat ID" rdfs:comment="An ICQ chat ID">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/nick"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/yahooChatID" vs:term_status="testing" rdfs:label="Yahoo chat ID" rdfs:comment="A Yahoo chat ID">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/nick"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/msnChatID" vs:term_status="testing" rdfs:label="MSN chat ID" rdfs:comment="An MSN chat ID">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/nick"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
  </rdf:Property>
<!-- ....................................................... -->
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/name" vs:term_status="testing" rdfs:label="name" rdfs:comment="A name for some thing.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:subPropertyOf rdf:resource="http://www.w3.org/2000/01/rdf-schema#label"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/firstName" vs:term_status="testing" rdfs:label="firstName" rdfs:comment="The first name of a person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>

  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/lastName" vs:term_status="testing" rdfs:label="lastName" rdfs:comment="The last name of a person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>

  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/givenName" vs:term_status="testing" rdfs:label="Given name" rdfs:comment="The given name of some person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/givenname" vs:term_status="archaic" rdfs:label="Given name" rdfs:comment="The given name of some person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/surname" vs:term_status="archaic" rdfs:label="Surname" rdfs:comment="The surname of some person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/family_name" vs:term_status="archaic" rdfs:label="family_name" rdfs:comment="The family name of some person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/familyName" vs:term_status="testing" rdfs:label="familyName" rdfs:comment="The family name of some person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
<!-- end of naming properties. See http://rdfweb.org/issues/show_bug.cgi?id=7
     for open issue / re-design discussions.
  -->
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/phone" vs:term_status="testing" rdfs:label="phone" rdfs:comment="A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/homepage" vs:term_status="stable" rdfs:label="homepage" rdfs:comment="A homepage for some thing.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/page"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/isPrimaryTopicOf"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
    <!--  previously: rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent" -->
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/weblog" vs:term_status="stable" rdfs:label="weblog" rdfs:comment="A weblog of some thing (whether person, group, company etc.).">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/page"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/openid" vs:term_status="testing" rdfs:label="openid" rdfs:comment="An OpenID for an Agent.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/isPrimaryTopicOf"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/tipjar" vs:term_status="testing" rdfs:label="tipjar" rdfs:comment="A tipjar document for this agent, describing means for payment and reward.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/page"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/plan" vs:term_status="testing" rdfs:label="plan" rdfs:comment="A .plan comment, in the tradition of finger and '.plan' files.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/made" vs:term_status="stable" rdfs:label="made" rdfs:comment="Something that was made by this agent.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <owl:inverseOf rdf:resource="http://xmlns.com/foaf/0.1/maker"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/maker"  vs:term_status="stable" rdfs:label="maker" rdfs:comment="An agent that
made this thing.">
    <owl:equivalentProperty rdf:resource="http://purl.org/dc/terms/creator"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <owl:inverseOf rdf:resource="http://xmlns.com/foaf/0.1/made"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/img" vs:term_status="testing" rdfs:label="image" rdfs:comment="An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one's photo on a homepage).">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Image"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/depiction"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/depiction" vs:term_status="testing" rdfs:label="depiction" rdfs:comment="A depiction of some thing.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Image"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <owl:inverseOf rdf:resource="http://xmlns.com/foaf/0.1/depicts"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/depicts" vs:term_status="testing" rdfs:label="depicts" rdfs:comment="A thing depicted in this representation.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Image"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <owl:inverseOf rdf:resource="http://xmlns.com/foaf/0.1/depiction"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/thumbnail" vs:term_status="testing" rdfs:label="thumbnail" rdfs:comment="A derived thumbnail image.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Image"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Image"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/myersBriggs" vs:term_status="testing" rdfs:label="myersBriggs" rdfs:comment="A Myers Briggs (MBTI) personality classification.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/workplaceHomepage" vs:term_status="testing" rdfs:label="workplace homepage" rdfs:comment="A workplace homepage of some person; the homepage of an organization they work for.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/workInfoHomepage" vs:term_status="testing" rdfs:label="work info homepage" rdfs:comment="A work info homepage of some person; a page about their work for some organization.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/schoolHomepage" vs:term_status="testing" rdfs:label="schoolHomepage" rdfs:comment="A homepage of a school attended by the person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/knows" vs:term_status="stable" rdfs:label="knows" rdfs:comment="A person known by this person (indicating some level of reciprocated interaction between the parties).">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/interest" vs:term_status="testing" rdfs:label="interest" rdfs:comment="A page about a topic of interest to this person.">
<!-- we should distinguish the page from the topic more carefully. danbri 2002-07-08 -->
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/topic_interest" vs:term_status="testing" rdfs:label="topic_interest" rdfs:comment="A thing of interest to this person.">
<!-- we should distinguish the page from the topic more carefully. danbri 2002-07-08 -->
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/publications" vs:term_status="testing" rdfs:label="publications" rdfs:comment="A link to the publications of this person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
<!-- by libby for ILRT mappings 2001-10-31 -->
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/currentProject" vs:term_status="testing" rdfs:label="current project" rdfs:comment="A current project this person works on.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/pastProject" vs:term_status="testing" rdfs:label="past project" rdfs:comment="A project this person has previously worked on.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Person"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/fundedBy" vs:term_status="archaic" rdfs:label="funded by" rdfs:comment="An organization funding a project or person.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/logo" vs:term_status="testing" rdfs:label="logo" rdfs:comment="A logo representing some thing.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/topic" vs:term_status="testing" rdfs:label="topic" rdfs:comment="A topic of some page or document.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <owl:inverseOf rdf:resource="http://xmlns.com/foaf/0.1/page"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/primaryTopic"
 vs:term_status="stable" rdfs:label="primary topic" rdfs:comment="The primary topic of some page or document.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#FunctionalProperty"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <owl:inverseOf rdf:resource="http://xmlns.com/foaf/0.1/isPrimaryTopicOf"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>

  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/focus"  vs:term_status="testing" rdfs:label="focus" rdfs:comment="The underlying or 'focal' entity associated with some SKOS-described concept.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2004/02/skos/core#Concept" rdfs:label="Concept"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>

  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/isPrimaryTopicOf"
 vs:term_status="stable" rdfs:label="is primary topic of" rdfs:comment="A document that this thing is the primary topic of.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#InverseFunctionalProperty"/>
    <rdfs:subPropertyOf rdf:resource="http://xmlns.com/foaf/0.1/page"/>
    <owl:inverseOf rdf:resource="http://xmlns.com/foaf/0.1/primaryTopic"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>

  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/page" vs:term_status="stable" rdfs:label="page" rdfs:comment="A page or document about this thing.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
    <owl:inverseOf rdf:resource="http://xmlns.com/foaf/0.1/topic"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/theme" vs:term_status="archaic" rdfs:label="theme" rdfs:comment="A theme.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Thing"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/account" vs:term_status="testing" rdfs:label="account" rdfs:comment="Indicates an account held by this agent.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/OnlineAccount"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/holdsAccount" vs:term_status="archaic" rdfs:label="account" rdfs:comment="Indicates an account held by this agent.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/OnlineAccount"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/accountServiceHomepage" vs:term_status="testing" rdfs:label="account service homepage" rdfs:comment="Indicates a homepage of the service provide for this online account.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/OnlineAccount"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Document"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/accountName" vs:term_status="testing" rdfs:label="account name" rdfs:comment="Indicates the name (identifier) associated with this online account.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/OnlineAccount"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>
  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/member" vs:term_status="stable" rdfs:label="member" rdfs:comment="Indicates a member of a Group">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#ObjectProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Group"/>
    <rdfs:range rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>

  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/membershipClass" vs:term_status="unstable" rdfs:label="membershipClass" rdfs:comment="Indicates the class of individuals that are a member of a Group">
    <!-- maybe we should just use SPARQL or Rules, instead of trying to use OWL here -->
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#AnnotationProperty"/>
    <!-- Added to keep OWL DL from bluescreening. DON'T CROSS THE STREAMERS, etc. -->
    <!-- This may get dropped if it means non-DL tools don't expose it as a real property.
   Should be fine though; I think only OWL stuff cares about AnnotationProperty.
   Dan                   -->

<!--    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Group"/> prose only for now...-->
<!--    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Class"/> -->
<!--    <rdfs:range rdf:resource="http://www.w3.org/2002/07/owl#Class"/> -->

    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>


  <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/birthday" vs:term_status="unstable" rdfs:label="birthday" rdfs:comment="The birthday of this Agent, represented in mm-dd string form, eg. '12-31'.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#FunctionalProperty"/>
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
    <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
    <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
    <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
  </rdf:Property>

   <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/age" vs:term_status="unstable" rdfs:label="age" rdfs:comment="The age in years of some agent.">
    <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#FunctionalProperty"/>
     <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
     <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
     <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
     <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
   </rdf:Property>

   <rdf:Property rdf:about="http://xmlns.com/foaf/0.1/status" vs:term_status="unstable" rdfs:label="status" rdfs:comment="A string expressing what the user is happy for the general public (normally) to know about their current activity.">
     <rdf:type rdf:resource="http://www.w3.org/2002/07/owl#DatatypeProperty"/>
     <rdfs:domain rdf:resource="http://xmlns.com/foaf/0.1/Agent"/>
     <rdfs:range rdf:resource="http://www.w3.org/2000/01/rdf-schema#Literal"/>
     <rdfs:isDefinedBy rdf:resource="http://xmlns.com/foaf/0.1/"/>
   </rdf:Property>

</rdf:RDF>
"""
