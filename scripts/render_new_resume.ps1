[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Add-Type -AssemblyName System.Drawing

function Render-Page1 {
    param($outputPath)
    $w = 1429
    $h = 2021
    $bmp = New-Object System.Drawing.Bitmap $w, $h
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $g.Clear([System.Drawing.Color]::White)

    $brushDark = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(26, 32, 44))
    $brushMuted = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(74, 85, 104))
    $brushHeaderSec = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(30, 58, 95))
    $brushBanner = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(235, 244, 246))

    $fontFamily = "Arial"
    $fnTitle = New-Object System.Drawing.Font ($fontFamily, 26, [System.Drawing.FontStyle]::Bold)
    $fnSub = New-Object System.Drawing.Font ($fontFamily, 13, [System.Drawing.FontStyle]::Bold)
    $fnContact = New-Object System.Drawing.Font ($fontFamily, 10.5, [System.Drawing.FontStyle]::Regular)
    $fnSec = New-Object System.Drawing.Font ($fontFamily, 11.5, [System.Drawing.FontStyle]::Bold)
    $fnItemTitle = New-Object System.Drawing.Font ($fontFamily, 11, [System.Drawing.FontStyle]::Bold)
    $fnItemSub = New-Object System.Drawing.Font ($fontFamily, 10.5, [System.Drawing.FontStyle]::Regular)
    $fnBody = New-Object System.Drawing.Font ($fontFamily, 9.5, [System.Drawing.FontStyle]::Regular)
    $fnBodyBold = New-Object System.Drawing.Font ($fontFamily, 9.5, [System.Drawing.FontStyle]::Bold)

    $margin = 65
    $contentWidth = $w - ($margin * 2)

    $global:y = 50

    # Header
    $g.DrawString("NEHAL ZADE", $fnTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 38
    $g.DrawString("Salesforce Developer", $fnSub, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 24
    $contactLine1 = "Nagpur, Maharashtra, India  |  nehalsyzade07@gmail.com  |  +91 7898884522"
    $g.DrawString($contactLine1, $fnContact, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 20
    $contactLine2 = "linkedin.com/in/nehal-zade-a37709233  |  salesforce.com/trailblazer/nehal04"
    $g.DrawString($contactLine2, $fnContact, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 30

    function Draw-Banner1($title) {
        $bannerHeight = 24
        $rect = New-Object System.Drawing.RectangleF ($margin, $global:y, $contentWidth, $bannerHeight)
        $g.FillRectangle($brushBanner, $rect)
        $g.DrawString($title, $fnSec, $brushHeaderSec, (New-Object System.Drawing.PointF (($margin + 8), ($global:y + 3))))
        $global:y += $bannerHeight + 8
    }

    # PROFILE SUMMARY
    Draw-Banner1 "PROFILE SUMMARY"
    $summary = "Having 4+ years of hands-on experience in the design, development, and end-to-end delivery of scalable enterprise applications on the Salesforce.com platform. Adept at gathering and analyzing business requirements to craft effective technical solutions that align with organizational goals. Proficient in leveraging Sales Cloud, Service Cloud, and Community Cloud to enhance business operations. Demonstrates deep understanding of the Force.com platform and Salesforce best practices."
    $size = $g.MeasureString($summary, $fnBody, [int]$contentWidth)
    $rect = New-Object System.Drawing.RectangleF ($margin, $global:y, $contentWidth, ($size.Height + 5))
    $g.DrawString($summary, $fnBody, $brushDark, $rect)
    $global:y += $size.Height + 12

    # WORK EXPERIENCE
    Draw-Banner1 "WORK EXPERIENCE"

    # MODV
    $g.DrawString("Salesforce Developer", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $sfRight = New-Object System.Drawing.StringFormat
    $sfRight.Alignment = [System.Drawing.StringAlignment]::Far
    $rectDate = New-Object System.Drawing.RectangleF ($margin, $global:y, $contentWidth, 20)
    $g.DrawString("April 2024 - Present", $fnItemTitle, $brushDark, $rectDate, $sfRight)
    $global:y += 18
    $g.DrawString("MODV India Pvt Ltd, Jaipur, Rajasthan", $fnItemSub, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 18

    $bulletsModv = @(
        "Analyze business requirements, participate in technical discussions, and translate business needs into scalable Salesforce technical solutions.",
        "Provide effort estimates, technical recommendations, and implementation approaches based on Salesforce best practices.",
        "Currently working extensively on Service Cloud, Agentforce Messaging, Agentforce Service Email, and Data Cloud.",
        "Configure and develop Agentforce solutions to support customer service use cases and improve customer interactions.",
        "Work with Agentforce Messaging to configure customer communication channels and build automated conversational experiences.",
        "Implement Agentforce Service Email capabilities to support automated customer service interactions through email.",
        "Work with Data Cloud Data Streams to ingest and connect data from different sources and support unified customer data requirements.",
        "Configure and customize Service Cloud features to support case management, customer service processes, automation, and agent productivity.",
        "Develop and maintain Apex Classes, Apex Triggers, Test Classes, Batch Apex, and asynchronous Apex while ensuring compliance with Salesforce governor limits.",
        "Develop reusable and scalable Lightning Web Components (LWC) and implement component communication based on business requirements.",
        "Build and maintain Flows, Validation Rules, Reports, Dashboards, Permission Sets, Profiles, Queues, and other Salesforce configurations.",
        "Design automation solutions using Record-Triggered Flows, Screen Flows, and scheduled automation to streamline business processes.",
        "Develop and consume REST APIs for integration between Salesforce and external applications.",
        "Perform SOQL/SOSL optimization and Apex code optimization to improve application performance and maintainability.",
        "Participate in code reviews and ensure development follows Salesforce coding standards and best practices.",
        "Perform deployment activities using VS Code, Git, Change Sets, and Salesforce deployment tools.",
        "Create and maintain test classes and ensure required code coverage for successful deployments.",
        "Troubleshoot production issues, analyze root causes, and implement sustainable technical solutions.",
        "Create and maintain technical documentation for development, configuration, integrations, and deployment process."
    )

    foreach ($b in $bulletsModv) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $bWidth = $contentWidth - 18
        $size = $g.MeasureString($b, $fnBody, [int]$bWidth)
        $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, $bWidth, ($size.Height + 2))
        $g.DrawString($b, $fnBody, $brushDark, $rect)
        $global:y += $size.Height + 3
    }
    $global:y += 10

    # Perigeon
    $g.DrawString("Salesforce Developer", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $rectDate = New-Object System.Drawing.RectangleF ($margin, $global:y, $contentWidth, 20)
    $g.DrawString("June 2022 - March 2024", $fnItemTitle, $brushDark, $rectDate, $sfRight)
    $global:y += 18
    $g.DrawString("Perigeon Software (Formerly Intforce Software), Ahmedabad, Gujrat", $fnItemSub, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 18

    $bulletsPerigeon = @(
        "Gathered and analyzed business requirements and translated them into Salesforce technical and functional solutions.",
        "Configured Salesforce Custom Objects, Fields, List Views, Profiles, Permission Sets, Roles, Queues, Users, and Security Settings.",
        "Implemented business requirements using Validation Rules, Process Builder, and Salesforce Flow.",
        "Developed Apex Classes, Apex Triggers, Batch Apex, and Test Classes while following Salesforce governor limits and coding best practices.",
        "Developed and customized Lightning Web Components (LWC) and implemented component communication.",
        "Designed and configured Salesforce Communities / Experience Cloud solutions.",
        "Developed automation using Flows and Process Builder to improve business process efficiency.",
        "Worked on Sales Cloud and Service Cloud functionality based on project requirements.",
        "Supported REST API integrations and web services between Salesforce and external applications.",
        "Created reports and dashboards to provide business insights and operational visibility.",
        "Participated in code reviews, debugging, testing, and performance optimization.",
        "Performed deployments using Change Sets and Salesforce deployment tools.",
        "Created test classes and maintained required code coverage for deployment.",
        "Participated in package creation, installation, configuration, and testing.",
        "Created technical documentation and deployment guides for project teams."
    )

    foreach ($b in $bulletsPerigeon) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $bWidth = $contentWidth - 18
        $size = $g.MeasureString($b, $fnBody, [int]$bWidth)
        $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, $bWidth, ($size.Height + 2))
        $g.DrawString($b, $fnBody, $brushDark, $rect)
        $global:y += $size.Height + 3
    }
    $global:y += 10

    # PROJECT EXPERIENCE
    Draw-Banner1 "PROJECT EXPERIENCE"

    $g.DrawString("Project - Netanders", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16
    $g.DrawString("Environment: Service Cloud, Agentforce, Data Cloud", $fnBodyBold, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16

    $bulletsNetanders = @(
        "Currently working on Service Cloud implementation and development activities to support customer service and case management processes.",
        "Working with Agentforce Messaging to build and configure AI-powered customer interactions.",
        "Implementing Agentforce Service Email to support automated and intelligent customer communication through email.",
        "Working with Agentforce configuration and Prompt Builder to design prompts and improve AI-generated responses.",
        "Working with Data Cloud Data Streams to ingest and synchronize data from external data sources.",
        "Supporting data integration and customer data unification requirements using Salesforce Data Cloud.",
        "Developing Apex Classes, Triggers, Test Classes, and asynchronous Apex based on business requirements.",
        "Developing reusable Lightning Web Components (LWC) and implementing component communication.",
        "Creating and maintaining Salesforce Flows to automate business processes and reduce manual operations.",
        "Creating and maintaining Reports and Dashboards to provide business users with operational and customer-service insights.",
        "Configuring Profiles, Permission Sets, Roles, Queues, and other security/access controls based on business requirements.",
        "Troubleshooting application issues, analyzing root causes, and implementing optimized solutions.",
        "Participating in requirement discussions with product managers, business analysts, and development teams.",
        "Performing code reviews and ensuring Apex and LWC implementations follow Salesforce best practices.",
        "Writing and maintaining test classes and ensuring sufficient code coverage.",
        "Supporting deployment activities using VS Code, Git, and Salesforce deployment tools.",
        "Maintaining technical documentation related to development, configuration, integrations, and deployment activities."
    )

    foreach ($b in $bulletsNetanders) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $bWidth = $contentWidth - 18
        $size = $g.MeasureString($b, $fnBody, [int]$bWidth)
        $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, $bWidth, ($size.Height + 2))
        $g.DrawString($b, $fnBody, $brushDark, $rect)
        $global:y += $size.Height + 3
    }
    $global:y += 8

    # Start JB project on Page 1
    $g.DrawString("Project - JB (E-commerce Site)", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16
    $g.DrawString("Environment: Sales Cloud, Service Cloud, Experience Cloud, Agentforce", $fnBodyBold, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16

    $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $bText = "Provided technical guidance and mentorship to junior developers and team members."
    $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, ($contentWidth - 18), 18)
    $g.DrawString($bText, $fnBody, $brushDark, $rect)

    $bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
    Write-Output "Created Page 1"
}

function Render-Page2 {
    param($outputPath)
    $w = 1429
    $h = 2021
    $bmp = New-Object System.Drawing.Bitmap $w, $h
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $g.Clear([System.Drawing.Color]::White)

    $brushDark = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(26, 32, 44))
    $brushMuted = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(74, 85, 104))
    $brushHeaderSec = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(30, 58, 95))
    $brushBanner = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(235, 244, 246))

    $fontFamily = "Arial"
    $fnSec = New-Object System.Drawing.Font ($fontFamily, 11.5, [System.Drawing.FontStyle]::Bold)
    $fnItemTitle = New-Object System.Drawing.Font ($fontFamily, 11, [System.Drawing.FontStyle]::Bold)
    $fnItemSub = New-Object System.Drawing.Font ($fontFamily, 10.5, [System.Drawing.FontStyle]::Regular)
    $fnBody = New-Object System.Drawing.Font ($fontFamily, 9.5, [System.Drawing.FontStyle]::Regular)
    $fnBodyBold = New-Object System.Drawing.Font ($fontFamily, 9.5, [System.Drawing.FontStyle]::Bold)

    $margin = 65
    $contentWidth = $w - ($margin * 2)

    $global:y = 50

    function Draw-Banner2($title) {
        $bannerHeight = 24
        $rect = New-Object System.Drawing.RectangleF ($margin, $global:y, $contentWidth, $bannerHeight)
        $g.FillRectangle($brushBanner, $rect)
        $g.DrawString($title, $fnSec, $brushHeaderSec, (New-Object System.Drawing.PointF (($margin + 8), ($global:y + 3))))
        $global:y += $bannerHeight + 8
    }

    # JB Project continued
    $jbBullets = @(
        "Analyzed business requirements and designed Salesforce solutions using configuration and custom development.",
        "Customized Salesforce using Apex, LWC, SOQL, Flows, and Validation Rules.",
        "Developed custom Experience Cloud functionality using Salesforce technologies.",
        "Created and maintained technical documentation, solution designs, and data models.",
        "Created packages and performed package installation and testing.",
        "Conducted code reviews to ensure adherence to Salesforce coding standards and best practices.",
        "Developed Agentforce functionality and prompts using Prompt Builder.",
        "Implemented customized Agentforce responses using Flows and Salesforce automation."
    )

    foreach ($b in $jbBullets) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $bWidth = $contentWidth - 18
        $size = $g.MeasureString($b, $fnBody, [int]$bWidth)
        $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, $bWidth, ($size.Height + 2))
        $g.DrawString($b, $fnBody, $brushDark, $rect)
        $global:y += $size.Height + 3
    }
    $global:y += 10

    # Project - MD Application
    $g.DrawString("Project - MD Application", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16
    $g.DrawString("Environment: Sales Cloud", $fnBodyBold, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16

    $mdBullets = @(
        "Collaborated with product managers and developers to design technical solutions.",
        "Participated in requirement analysis, development, testing, and deployment activities.",
        "Replaced legacy triggers with Salesforce Flows where appropriate to simplify automation and improve maintainability.",
        "Developed and optimized Apex Classes and Test Classes.",
        "Conducted code reviews and optimized Apex implementations.",
        "Deployed Salesforce changes using VS Code and source-driven development practices.",
        "Ensured required code coverage and deployment quality."
    )
    foreach ($b in $mdBullets) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $bWidth = $contentWidth - 18
        $size = $g.MeasureString($b, $fnBody, [int]$bWidth)
        $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, $bWidth, ($size.Height + 2))
        $g.DrawString($b, $fnBody, $brushDark, $rect)
        $global:y += $size.Height + 3
    }
    $global:y += 10

    # Project - Call Application
    $g.DrawString("Project - Call Application", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16
    $g.DrawString("Environment: Sales Cloud, Service Cloud", $fnBodyBold, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16

    $callBullets = @(
        "Collaborated with team members and developers to design and implement Salesforce solutions.",
        "Developed Apex Classes, Triggers, Batch Apex, and Lightning Web Components.",
        "Implemented Salesforce automation based on business requirements.",
        "Participated in package creation, installation, configuration, and testing.",
        "Created and maintained technical documentation and deployment guides.",
        "Supported debugging, testing, and production issue resolution."
    )
    foreach ($b in $callBullets) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $bWidth = $contentWidth - 18
        $size = $g.MeasureString($b, $fnBody, [int]$bWidth)
        $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, $bWidth, ($size.Height + 2))
        $g.DrawString($b, $fnBody, $brushDark, $rect)
        $global:y += $size.Height + 3
    }
    $global:y += 10

    # Project - ECA
    $g.DrawString("Project - ECA", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16
    $g.DrawString("Environment: Sales Cloud, Service Cloud", $fnBodyBold, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 16

    $ecaBullets = @(
        "Collaborated with the team to gather business requirements and translate them into technical specifications.",
        "Configured Profiles, Permission Sets, Users, Roles, and Queues based on access requirements.",
        "Implemented Salesforce security and access controls.",
        "Replaced legacy triggers with Flows where appropriate.",
        "Created Custom Objects, Fields, List Views, Profiles, Permission Sets, Queues, and Roles.",
        "Configured Validation Rules, Process Builder, and Flow Builder to automate business processes.",
        "Supported testing, deployment, troubleshooting, and production issue resolution."
    )
    foreach ($b in $ecaBullets) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $bWidth = $contentWidth - 18
        $size = $g.MeasureString($b, $fnBody, [int]$bWidth)
        $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, $bWidth, ($size.Height + 2))
        $g.DrawString($b, $fnBody, $brushDark, $rect)
        $global:y += $size.Height + 3
    }
    $global:y += 12

    # SKILLS
    Draw-Banner2 "SKILLS"
    $skillsList = @(
        "Apex, Apex Triggers, Batch Apex, Asynchronous Apex, Test Classes, SOQL, SOSL, Lightning Web Components (LWC), Salesforce Flows, REST API, Web Services, External System Integration, Postman",
        "HTML, CSS, JavaScript, Salesforce Lightning Design System (SLDS)",
        "Sales Cloud, Service Cloud, Experience Cloud, Agentforce, Data Cloud, CPQ",
        "Agentforce Messaging, Agentforce Service Email, Prompt Builder, Agentforce Actions, AI-powered customer service automation",
        "VS Code, GitHub, Workbench, Apex Data Loader, Postman, Change Sets, Salesforce Extension",
        "Package Creation, Package Installation, Code Review, Debugging, Performance Optimization, Governor Limit Optimization, Deployment Management"
    )
    foreach ($s in $skillsList) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $bWidth = $contentWidth - 18
        $size = $g.MeasureString($s, $fnBody, [int]$bWidth)
        $rect = New-Object System.Drawing.RectangleF (($margin + 18), $global:y, $bWidth, ($size.Height + 2))
        $g.DrawString($s, $fnBody, $brushDark, $rect)
        $global:y += $size.Height + 3
    }
    $global:y += 12

    # CERTIFICATIONS
    Draw-Banner2 "CERTIFICATIONS"
    $certs = @(
        "Salesforce Certified Platform Administrator",
        "Salesforce Certified Platform Developer I",
        "Salesforce Certified Platform App Builder",
        "Salesforce Certified CPQ Administrator",
        "Salesforce Certified Agentforce Specialist",
        "Salesforce Certified AI Associate",
        "Salesforce Certified Associate"
    )
    foreach ($c in $certs) {
        $g.DrawString("-", $fnBodyBold, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
        $g.DrawString($c, $fnBody, $brushDark, (New-Object System.Drawing.PointF (($margin + 18), $global:y)))
        $global:y += 18
    }
    $global:y += 12

    # EDUCATION
    Draw-Banner2 "EDUCATION"
    $g.DrawString("Bachelor of Engineering", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 18
    $g.DrawString("RTM Nagpur University, Nagpur, Maharashtra - Graduated: 2018", $fnBody, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 20
    $g.DrawString("Diploma (Polytechnic)", $fnItemTitle, $brushDark, (New-Object System.Drawing.PointF ($margin, $global:y)))
    $global:y += 18
    $g.DrawString("MSBTE, Nagpur, Maharashtra - Graduated: 2015", $fnBody, $brushMuted, (New-Object System.Drawing.PointF ($margin, $global:y)))

    $bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
    Write-Output "Created Page 2 Successfully"
}

Render-Page1 "d:\Family\Nehal\Programming\portfolio_website\public\resume-1.png"
Render-Page2 "d:\Family\Nehal\Programming\portfolio_website\public\resume-2.png"
