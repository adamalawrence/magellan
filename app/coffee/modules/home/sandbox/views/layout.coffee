RawRDFXML = require './rdf'

UploadWidget = require '../../../../widgets/upload/upload'

# # # # #

$rdf = require 'rdflib'
jsonld = require 'jsonld'
rdfxml_parser = require 'rdf-parser-rdfxml'
jsonld_serializer = require 'rdf-serializer-jsonld'

# # # # # #

# For quick access to those namespaces:
FOAF = $rdf.Namespace('http://xmlns.com/foaf/0.1/')
RDF = $rdf.Namespace('http://www.w3.org/1999/02/22-rdf-syntax-ns#')
RDFS = $rdf.Namespace('http://www.w3.org/2000/01/rdf-schema#')
OWL = $rdf.Namespace('http://www.w3.org/2002/07/owl#')
DC = $rdf.Namespace('http://purl.org/dc/elements/1.1/')
RSS = $rdf.Namespace('http://purl.org/rss/1.0/')
XSD = $rdf.Namespace('http://www.w3.org/TR/2004/REC-xmlschema-2-20041028/#dt-')
CONTACT = $rdf.Namespace('http://www.w3.org/2000/10/swap/pim/contact#')

# # # # #

kb = $rdf.graph()
rdf_parser = new $rdf.RDFParser(kb)

# # # # #

class SandboxLayout extends Mn.LayoutView
  className: 'container-fluid'
  template: require './templates/layout'

  regions:
    uploadRegion: '[data-region=upload]'

  onRender: ->
    console.log 'RENDERD'
    console.log RawRDFXML

    # Parses doc from raw XML
    doc = rdfxml_parser.parseXmlDom(RawRDFXML)

    # Parses doc into graph
    rdf_parser.parse(doc, 'http://foo.bar')

    # Formats as NQUADS
    nquads = kb.toString().replace(/{/g,'').replace(/}/g,'')

    # Deserialize N-Quads (RDF) to JSON-LD
    jsonld.fromRDF nquads, {format: 'application/nquads'}, (err, doc) =>

      if err
        console.log 'ERR!!!'
        console.log err
        return

      output = { '@context': kb.namespaces, '@graph': doc }
      # console.log output

      $('.output').text JSON.stringify(output, null, 2)

# # # # #

module.exports = SandboxLayout
