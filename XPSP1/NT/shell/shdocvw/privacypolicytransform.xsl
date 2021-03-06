<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
<_locDefinition>
<_locDefault _loc="locNone"/>
 <_locTag _loc="locData">HTML</_locTag>
 <_locTag _loc="locData">SPAN</_locTag>
 <_locTag _loc="locData">DIV</_locTag>
 <_locTag _loc="locData">TITLE</_locTag>
 <_locTag _loc="locData">A</_locTag>
 <_locTag _loc="locData">a</_locTag>
 <_locTag _loc="locData">U</_locTag>
 <_locTag _loc="locData">STYLE</_locTag>
</_locDefinition>

<xsl:script language="JScript">
	var icnt=1;
	function increment(i) {	icnt = icnt - 1; return i - icnt;}
	var icnt2=1;
	function increment2(i) {	icnt2 = icnt2 - 1; return i - icnt2;}
</xsl:script>

<xsl:template match="/">
   <HTML DIR="LTR">
   <HEAD>
   <TITLE>Privacy Report</TITLE>
   <STYLE TYPE="text/css">
	   .head 	{	
	   			font-family: MS Shell Dlg;
				font-size:11pt;
				font-weight:bold;
				color:windowtext;
				text-align:left;
				margin-bottom:8pt;
				}
		.indentedData	{
	   			font-family: MS Shell Dlg;
				font-size:10pt;
				margin-left:4em;
				margin-top:8pt;
				font-weight:100;
				color:windowtext;
				text-align:left;
				margin-bottom:8pt;
				}
		.multiStatement {
				font-family: MS Shell Dlg;
				font-size:10pt;
				xmargin-bottom:4pt;
				display:none;
				}
		.goTop	{
	   			font-family: MS Shell Dlg;
				font-size:10pt;
				font-weight:100;
				text-align:left;
				}
   </STYLE>
   <SCRIPT>
   <xsl:comment>
   var myIncrement = 1; 
   var myIncrement2 = 1; 
    
   function printSite()
   {
       document.write( window.parent.dialogArguments.url);
   }
   
   function BodyOnKeyPress(nCode)
   { 
       if (nCode == 27)    //ESC
       {
            window.parent.cancelButtonClick();
       }
   }
   </xsl:comment>
   </SCRIPT>
   </HEAD>
   <BODY onkeypress="BodyOnKeyPress(event.keyCode)" onload="sitePolicy.href = window.parent.dialogArguments.CreateAbsoluteUrl(sitePolicy.myURI);siteURL.href = window.parent.dialogArguments.CreateAbsoluteUrl(siteURL.myURI)">

   <A name="top">
   </A>
   <DIV class="head">Privacy Summary for: <BR/><BR/>
		<DIV class="indentedData">
   			<xsl:apply-templates select="//DATA-GROUP/DATA" />
		</DIV>
		<DIV class="indentedData">
		To read this Web site's complete privacy policy, click <A foo="bar" id="sitePolicy" target="_blank">
		<xsl:attribute name="myURI">
				<xsl:apply-templates select="POLICY/@discuri" />
		</xsl:attribute>
		here</A>.
		</DIV>
   </DIV>
   <xsl:choose>
   		<xsl:when test="//TEST">
			<DIV class="head">This privacy policy is for testing purposes only</DIV>
		</xsl:when>
   </xsl:choose>
	<xsl:choose>
		<xsl:when test="//DISPUTES-GROUP/DISPUTES/IMG">
			<DIV class="head">Privacy Certificate: <BR/><BR/>
			</DIV>
			<DIV class="indentedData">
				<xsl:for-each select="//DISPUTES-GROUP/DISPUTES/IMG">
					<IMG target="_blank" id="siteDisputes">
						<xsl:attribute name="myURI">
								<xsl:value-of select="@src" />
						</xsl:attribute>
					</IMG>
					<SCRIPT>
						siteDisputes.src = window.parent.dialogArguments.CreateAbsoluteUrl(siteDisputes.myURI);
						siteDisputes.id = "";
					</SCRIPT>

				<BR/>
				</xsl:for-each>
				<A HREF="#Dispute">Register a dispute</A>
			</DIV>
		</xsl:when>
		<xsl:otherwise>
			<SPAN class="head" id="siteDisputes"></SPAN>
		</xsl:otherwise>
	</xsl:choose>
	<BR/><BR/>
	
	<DIV class="multiStatement" id="multiStatement">
		This site has multiple privacy statements:
		<DIV ID="toc">
		<xsl:for-each select="//STATEMENT">
			<DIV class="indentedData">
				<A>
			<xsl:attribute name="HREF">#myDIV<xsl:eval>increment2(0)</xsl:eval></xsl:attribute>
				Statement 
				<SCRIPT>
				<xsl:comment>
				document.writeln(myIncrement2);
				myIncrement2++;
				</xsl:comment>
				</SCRIPT>
				<SPAN>
					<xsl:choose>
						<xsl:when test="EXTENSION/GROUP-INFO/@name">
							-- <xsl:value-of select="EXTENSION/GROUP-INFO/@name" />
						</xsl:when>
						<xsl:otherwise>
							  
						</xsl:otherwise>
					</xsl:choose>
				</SPAN>
				</A>
			</DIV>
		</xsl:for-each>
		</DIV>
		<BR/>
		<BR/>
	</DIV>
	
   <xsl:for-each select="//STATEMENT">
			<DIV>
			<A>
			<xsl:attribute name="NAME">myDIV<xsl:eval>increment(0)</xsl:eval></xsl:attribute>
				<DIV class="head">
				Site statement
				<SCRIPT>
				<xsl:comment>
				document.writeln(myIncrement);
				if(myIncrement > 1)document.all.multiStatement.style.display = "block";
				</xsl:comment>
				</SCRIPT>
				<!-- </SPAN> -->
				<SPAN>
					<xsl:choose>
						<xsl:when test="EXTENSION/GROUP-INFO/@name">
							-- <xsl:value-of select="EXTENSION/GROUP-INFO/@name" />
						</xsl:when>
						<xsl:otherwise>
							  
						</xsl:otherwise>
					</xsl:choose>
				</SPAN>
				</DIV><!--  -->
				<SCRIPT>
				<xsl:comment>
				myIncrement++;
				</xsl:comment>
				</SCRIPT>
					<xsl:choose>
						<xsl:when test="DATA-GROUP/DATA/CATEGORIES">
							<SPAN class="head">
							What kind of information does this Web site collect?
							</SPAN><BR /><BR />
							<DIV class="indentedData">
					   		<xsl:apply-templates select="DATA-GROUP/DATA/CATEGORIES" />
							</DIV>
						</xsl:when>
						<xsl:otherwise>
							  
						</xsl:otherwise>
					</xsl:choose>
					
					<SPAN class="head">
					Why is this information collected?
					</SPAN><BR /><BR />
					<DIV class="indentedData">
			   		<xsl:apply-templates select="PURPOSE" />
					</DIV>
					
					<SPAN class="head">
					Who has access to this information?
					</SPAN><BR /><BR />
					<DIV class="indentedData">
			   		<xsl:apply-templates select="RECIPIENT" />
					</DIV>
					
					<SPAN class="head">
					How long is the information retained?
					</SPAN><BR /><BR />
					<DIV class="indentedData">
			   		<xsl:apply-templates select="RETENTION" />
					</DIV>
					
					<SPAN class="head">
					Do users have access to their information collected by the Web site?
					</SPAN><BR /><BR />
					<DIV class="indentedData">
			   		<xsl:apply-templates select="//ACCESS" />
					</DIV>
				</A>
			</DIV>
		<A HREF="#top" class="goTop">Back to Top</A><BR/><BR/>
	</xsl:for-each>
	
	<xsl:choose>
	<xsl:when test="//DISPUTES">
		<SPAN class="head">
		<A NAME="Dispute">
		How does this Web site handle disputes about collected data?
		</A>
		</SPAN><BR /><BR />
			<xsl:choose>
				<xsl:when test="//DISPUTES[@resolution-type='service']">
					<DIV class="indentedData">
					<xsl:for-each select="//DISPUTES-GROUP/DISPUTES">
						<a id="howToRegisterDisputesLinkService" target="_blank">
							<xsl:attribute name="myURI">
									<xsl:value-of select="@service" />
							</xsl:attribute>
							<xsl:value-of select="@short-description" />
						</a><BR/>
						<xsl:value-of select="@long-description" />
						<SCRIPT>
							howToRegisterDisputesLinkService.href = window.parent.dialogArguments.CreateAbsoluteUrl(howToRegisterDisputesLinkService.myURI);
							howToRegisterDisputesLinkService.id = "";
						</SCRIPT>
					<BR/>
					</xsl:for-each>
					</DIV>
				</xsl:when>
				<xsl:when test="//DISPUTES[@resolution-type='independent']">
					<DIV class="indentedData">
					<xsl:for-each select="//DISPUTES-GROUP/DISPUTES">
						<a id="howToRegisterDisputesLinkIndependent" target="_blank">
							<xsl:attribute name="myURI">
									<xsl:value-of select="@service" />
							</xsl:attribute>
							<xsl:value-of select="@short-description" />
						</a><BR/>
						<SCRIPT>
							howToRegisterDisputesLinkIndependent.href = window.parent.dialogArguments.CreateAbsoluteUrl(howToRegisterDisputesLinkIndependent.myURI);
							howToRegisterDisputesLinkIndependent.id = "";
						</SCRIPT>
						<xsl:value-of select="@long-description" />
					<BR/>
					</xsl:for-each>
					</DIV>
					
				</xsl:when>
				<xsl:when test="//DISPUTES[@resolution-type='court']">
					<DIV class="indentedData">
						<SPAN>
						Individual may file a legal complaint against the Web site.
						</SPAN>
						<BR/>
					</DIV>
				</xsl:when>
				<xsl:when test="//DISPUTES[@resolution-type='law']">
					<DIV class="indentedData">
						<SPAN>
						Disputes arising in connection with the privacy statement will be resolved in accordance with the law referenced in the description.
						</SPAN>
						<BR/>
					</DIV>
				</xsl:when>
				<xsl:otherwise>    
					
				</xsl:otherwise>
			</xsl:choose>
	</xsl:when>
	</xsl:choose>
   </BODY>
   </HTML>
</xsl:template>

<xsl:template match="ACCESS">
    	<xsl:apply-templates select="nonident" />
    	<xsl:apply-templates select="all" />
    	<xsl:apply-templates select="contact-and-other" />
    	<xsl:apply-templates select="ident-contact" />
    	<xsl:apply-templates select="other-ident" />
    	<xsl:apply-templates select="none" />
</xsl:template>

<xsl:template match="PURPOSE">
    	<xsl:apply-templates select="current" />
    	<xsl:apply-templates select="admin" />
    	<xsl:apply-templates select="develop" />
    	<xsl:apply-templates select="customization" />
    	<xsl:apply-templates select="tailoring" />
    	<xsl:apply-templates select="pseudo-analysis" />
    	<xsl:apply-templates select="pseudo-decision" />
    	<xsl:apply-templates select="individual-analysis" />
    	<xsl:apply-templates select="individual-decision" />
    	<xsl:apply-templates select="contact" />
    	<xsl:apply-templates select="historical" />
    	<xsl:apply-templates select="telemarketing" />
    	<xsl:apply-templates select="other-purpose" />
</xsl:template>

<xsl:template match="RECIPIENT">
    	<xsl:apply-templates select="ours" />
    	<xsl:apply-templates select="delivery" />
    	<xsl:apply-templates select="same" />
    	<xsl:apply-templates select="other-recipient" />
    	<xsl:apply-templates select="unrelated" />
    	<xsl:apply-templates select="public" />
</xsl:template>

<xsl:template match="RETENTION">
    	<xsl:apply-templates select="no-retention" />
    	<xsl:apply-templates select="stated-purpose" />
    	<xsl:apply-templates select="legal-requirement" />
    	<xsl:apply-templates select="business-practices" />
    	<xsl:apply-templates select="indefinitely" />
</xsl:template>


<xsl:template match="CATEGORIES">
    	<xsl:apply-templates select="physical" />
    	<xsl:apply-templates select="online" />
    	<xsl:apply-templates select="uniqueid" />
    	<xsl:apply-templates select="purchase" />
    	<xsl:apply-templates select="financial" />
    	<xsl:apply-templates select="computer" />
    	<xsl:apply-templates select="navigation" />
    	<xsl:apply-templates select="interactive" />
    	<xsl:apply-templates select="demographic" />
    	<xsl:apply-templates select="content" />
    	<xsl:apply-templates select="state" />
    	<xsl:apply-templates select="political" />
    	<xsl:apply-templates select="health" />
    	<xsl:apply-templates select="preference" />
    	<xsl:apply-templates select="government" />
    	<xsl:apply-templates select="other-category" />
</xsl:template>

<!-- **************The Granular Templates************** -->

<xsl:template match="nonident">
	<SPAN>
	Personally identifiable information is not collected and therefore is not accessible.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="all">
	<SPAN>
	All personally identifiable information.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="contact-and-other">
	<SPAN>
	Personally identifiable online and physical contact information, as well as to other information linked to an identifiable person.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="ident-contact">
	<SPAN>
	Personally identifiable online and physical contact information such as a postal address.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="other-ident">
	<SPAN>
	Certain other information linked to an identifiable person such as online account charges.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="none">
	<SPAN>
	None.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="current">
	<SPAN>
	Information may be used by the Web site to complete the activity for which it was provided, whether the activity is a one-time event, such as returning the results from a Web search, forwarding an e-mail message or placing an order; or a recurring event, such as providing a subscription service or allowing access to an online address book or electronic wallet.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="admin">
	<SPAN>
	Information may be used for the technical support of the Web site and its computer system. For example, to process computer account information, to secure and maintain the site, or to verify Web site activity by the site or its agents.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="develop">
	<SPAN>
	Information may be used to enhance, evaluate, or otherwise review the Web site, service, product, or market. 
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="customization">
	<SPAN>
	<!--Information might be used to tailor or modify the content or design of this Web site only to specifications affirmatively selected by the particular individual during a single visit or multiple visits to the site.
	--></SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="tailoring">
	<SPAN>
	Information may be used to tailor or modify the content or design of the Web site during a single visit to the site. For example, an online store might suggest other items for a visitor to purchase based on items he has already placed in his shopping basket.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="pseudo-analysis">
	<SPAN>
	Information that is based upon a unique identifier but that cannot be linked to an individual may be used for research, analysis, and reporting. For example, the number of users within a ZIP code.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="pseudo-decision">
	<SPAN>
	Information that is based upon a unique identifier but that cannot be linked an individual may be used to make a decision that directly affects that individual. For example, an individual within a certain ZIP code is presented with advertisements for companies located in that same ZIP code.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="individual-analysis">
	<SPAN>
	Information that can be linked to an individual may be used for research, analysis, and reporting. For example, data about the types of and price ranges of products an individual has looked at.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="individual-decision">
	<SPAN>
	Information that can be linked to an individual may be used to make a decision that directly affects that individual. For example, a Web site might show an individual houses that are within her ability to purchase, regardless of the price range she has researched before.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="contact">
	<SPAN>
	Information may be used to contact an individual, through a communications channel other than voice telephone, for the promotion of a product or service. This includes notifying visitors about updates to the Web site.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="historical">
	<SPAN>
	Information may be archived or stored for the purpose of preserving social history as governed by an existing law or policy.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="telemarketing">
	<SPAN>
	Information may be used to contact the individual via voice telephone for promotion of a product or service.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="other-purpose">
	<SPAN>
	Other Uses: <xsl:value-of match="other-purpose" />
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="ours">
	<SPAN>
	This Web site, entities for whom it is acting as an agent, and/or entities acting as its agent. An agent in this instance is defined as a third party that processes data only for the completion of the stated purpose, such as a shipping firm or printing service.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="delivery">
	<SPAN>
	Legal entities performing delivery services that may use data for purposes other than completion of the stated purpose.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="same">
	<SPAN>
	Legal entities that have equivalent practices to this Web site.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="other-recipient">
	<SPAN>
	Legal entities that are constrained by and accountable to this Web site, but may use the data in a way not specified in this Web site's practices.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="unrelated">
	<SPAN>
	Legal entities whose data usage practices are not known by this Web site.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="public">
	<SPAN>
	Public forums such as bulletin boards, public directories, or commercial CD-ROM directories.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="no-retention">
	<SPAN>
	Information is not retained longer than the single online interaction. 
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="stated-purpose">
	<SPAN>
	Information is retained to meet the stated purpose and discarded at the earliest time possible.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="legal-requirement">
	<SPAN>
	Information is retained beyond the time it takes to complete the stated purpose because of a legal requirement or liability. For example, a law may allow consumers to dispute transactions within a certain time frame, therefore a Web site may decide to keep a record of transactions.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="business-practices">
	<SPAN>
	Information is retained per the service provider's stated business practices.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="indefinitely">
	<SPAN>
	Information is retained for an indeterminate period of time.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="physical">
	<SPAN>
	Information that allows an individual to be contacted or located in the physical world, such as a telephone number or a postal address.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="online">
	<SPAN>
	Information that allows an individual to be contacted or located on the Internet, such as an e-mail address. Often, this information is independent of the specific computer used to access the network.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="uniqueid">
	<SPAN>
	Unique identifiers issued by a Web site or service for the purpose of identifying an individual over time. 
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="purchase">
	<SPAN>
	Information generated by the purchase of a product or service, including information about the method of payment.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="financial">
	<SPAN>
	Information about an individual's finances, including account status, account balance, payment or overdraft history, and information about an individual's purchase or use of financial instruments, including credit cards or debit cards.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="computer">
	<SPAN>
	Information about the computer system that the individual is using to access the Internet, such as the IP number, domain name, browser type, or operating system.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="navigation">
	<SPAN>
	Information generated by browsing the Web site, such as which pages are visited, and how long an individual stays on each page.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="interactive">
	<SPAN>
	Information generated from or reflecting explicit interactions with the Web site, such as queries to a search engine, or logs of account activity.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="demographic">
	<SPAN>
	Demographic and socioeconomic data, such as gender, age, and income, not tied to an identifiable person. 
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="content">
	<SPAN>
	The words and expressions contained in the body of a communication. For example, the text of an e-mail message, bulletin board postings, or chat room communications.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="state">
	<SPAN>
	Mechanisms, such as HTTP cookies, for maintaining an active connection with an individual or for automatically identifying an individual who has visited a particular site or previously accessed particular content.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="political">
	<SPAN>
	Information about membership in or affiliation with groups such as religious organizations, trade unions, professional associations, political parties, etc.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="health">
	<SPAN>
	Information about an individual's physical or mental health, sexual orientation, use of or inquiry into health care services or products, and purchase of health care services or products.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="preference">
	<SPAN>
	Data about an individual's likes and dislikes, such as favorite color or musical tastes. 
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="location">
	<SPAN>
	Information, such as global positioning data, that can be used to identify an individual's current physical location and track him as his location changes.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="government">
	<SPAN>
	Identifiers issued by a government for purposes of identifying an individual over time, such as a driver's license number, social security number, or passport number.
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="other-category">
	<SPAN>
	Other: <xsl:value-of match="other-category" />
	</SPAN>
	<BR/><BR/>
</xsl:template>

<xsl:template match="DATA[@ref='#business.name']">
	<A id="siteURL" target="_blank">
		<xsl:attribute name="myURI">
				<xsl:value-of select="//DATA-GROUP/DATA[@ref='#business.contact-info.online.uri']" />
		</xsl:attribute>
		<xsl:value-of select="." />
	</A>
</xsl:template>

<xsl:template match="POLICY/@discuri">
		<xsl:value-of select="." />
</xsl:template>

<xsl:template match="//EXPIRY">
	<xsl:value-of select="@date" />
</xsl:template>

</xsl:stylesheet> 