Add-Type -AssemblyName System.Drawing

$code = @"
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;

public class ResumeDrawer
{
    private Bitmap bmp;
    private Graphics g;
    private float y;
    private float margin = 72f;
    private float contentWidth;

    private SolidBrush brushDark = new SolidBrush(Color.FromArgb(28, 33, 40));
    private SolidBrush brushMuted = new SolidBrush(Color.FromArgb(85, 95, 110));
    private SolidBrush brushBannerBg = new SolidBrush(Color.FromArgb(233, 243, 245));
    private SolidBrush brushBannerText = new SolidBrush(Color.FromArgb(16, 52, 70));

    private Font fontName = new Font("Segoe UI", 26f, FontStyle.Bold);
    private Font fontRole = new Font("Segoe UI", 13.5f, FontStyle.Bold);
    private Font fontContact = new Font("Segoe UI", 10.2f, FontStyle.Regular);
    private Font fontBanner = new Font("Segoe UI", 11.2f, FontStyle.Bold);
    private Font fontItemTitle = new Font("Segoe UI", 11f, FontStyle.Bold);
    private Font fontItemSub = new Font("Segoe UI", 10.2f, FontStyle.Regular);
    private Font fontEnv = new Font("Segoe UI", 9.8f, FontStyle.Bold);
    private Font fontBody = new Font("Segoe UI", 9.6f, FontStyle.Regular);
    private Font fontBodyBold = new Font("Segoe UI", 9.6f, FontStyle.Bold);

    public ResumeDrawer()
    {
        bmp = new Bitmap(1429, 2021);
        g = Graphics.FromImage(bmp);
        g.SmoothingMode = SmoothingMode.AntiAlias;
        g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit;
        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
        g.Clear(Color.White);
        contentWidth = 1429f - (margin * 2f);
        y = 52f;
    }

    public void DrawHeader(string name, string role, string contact1, string contact2)
    {
        g.DrawString(name, fontName, brushDark, margin, y);
        y += 40f;
        g.DrawString(role, fontRole, brushDark, margin, y);
        y += 24f;
        g.DrawString(contact1, fontContact, brushMuted, margin, y);
        y += 20f;
        g.DrawString(contact2, fontContact, brushMuted, margin, y);
        y += 24f;
    }

    public void DrawBanner(string title)
    {
        y += 6f;
        float bannerHeight = 25f;
        g.FillRectangle(brushBannerBg, margin, y, contentWidth, bannerHeight);
        g.DrawString(title, fontBanner, brushBannerText, margin + 8f, y + 3.5f);
        y += bannerHeight + 9f;
    }

    public void DrawParagraph(string text)
    {
        SizeF size = g.MeasureString(text, fontBody, (int)contentWidth);
        RectangleF rect = new RectangleF(margin, y, contentWidth, size.Height + 4f);
        g.DrawString(text, fontBody, brushDark, rect);
        y += size.Height + 8f;
    }

    public void DrawJob(string title, string date, string company)
    {
        g.DrawString(title, fontItemTitle, brushDark, margin, y);
        StringFormat sfRight = new StringFormat { Alignment = StringAlignment.Far };
        g.DrawString(date, fontItemTitle, brushDark, new RectangleF(margin, y, contentWidth, 22f), sfRight);
        y += 18f;
        g.DrawString(company, fontItemSub, brushMuted, margin, y);
        y += 18f;
    }

    public void DrawProject(string title, string env)
    {
        g.DrawString(title, fontItemTitle, brushDark, margin, y);
        y += 17f;
        g.DrawString(env, fontEnv, brushMuted, margin, y);
        y += 18f;
    }

    public void DrawBullet(string text)
    {
        float bulletWidth = 18f;
        g.DrawString("\u2022", fontBodyBold, brushDark, margin + 2f, y);
        float textWidth = contentWidth - bulletWidth;
        SizeF size = g.MeasureString(text, fontBody, (int)textWidth);
        RectangleF rect = new RectangleF(margin + bulletWidth, y, textWidth, size.Height + 2f);
        g.DrawString(text, fontBody, brushDark, rect);
        y += size.Height + 2f;
    }

    public void DrawEducation(string degree, string institution)
    {
        g.DrawString(degree, fontItemTitle, brushDark, margin, y);
        y += 18f;
        g.DrawString(institution, fontItemSub, brushMuted, margin, y);
        y += 20f;
    }

    public void AddSpace(float pixels)
    {
        y += pixels;
    }

    public void Save(string path)
    {
        bmp.Save(path, ImageFormat.Png);
        g.Dispose();
        bmp.Dispose();
    }

    public static void GeneratePages(string p1, string p2)
    {
        // ================= PAGE 1 =================
        ResumeDrawer d1 = new ResumeDrawer();
        d1.DrawHeader(
            "NEHAL ZADE",
            "Salesforce Developer",
            "Nagpur, Maharashtra, India  |  nehalsyzade07@gmail.com  |  +91 7898884522",
            "linkedin.com/in/nehal-zade-a37709233  |  salesforce.com/trailblazer/nehal04"
        );

        d1.DrawBanner("PROFILE SUMMARY");
        d1.DrawParagraph("Having 4+ years of hands-on experience in the design, development, and end-to-end delivery of scalable enterprise applications on the Salesforce.com platform. Adept at gathering and analyzing business requirements to craft effective technical solutions that align with organizational goals. Proficient in leveraging Sales Cloud, Service Cloud, and Community Cloud to enhance business operations. Demonstrates deep understanding of the Force.com platform and Salesforce best practices.");

        d1.DrawBanner("WORK EXPERIENCE");
        d1.DrawJob("Salesforce Developer", "April 2024 \u2013 Present", "MODV India Pvt Ltd, Jaipur, Rajasthan");
        string[] modvBullets = new string[] {
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
        };
        foreach (string b in modvBullets) { d1.DrawBullet(b); }
        d1.AddSpace(10f);

        d1.DrawJob("Salesforce Developer", "June 2022 \u2013 March 2024", "Perigeon Software (Formerly Intforce Software), Ahmedabad, Gujrat");
        string[] perigeonBullets = new string[] {
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
        };
        foreach (string b in perigeonBullets) { d1.DrawBullet(b); }
        d1.AddSpace(10f);

        d1.DrawBanner("PROJECT EXPERIENCE");
        d1.DrawProject("Project \u2013 Netanders", "Environment: Service Cloud, Agentforce, Data Cloud");
        string[] netandersBullets = new string[] {
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
        };
        foreach (string b in netandersBullets) { d1.DrawBullet(b); }
        d1.AddSpace(8f);

        d1.DrawProject("Project \u2013 JB (E-commerce Site)", "Environment: Sales Cloud, Service Cloud, Experience Cloud, Agentforce");
        d1.DrawBullet("Provided technical guidance and mentorship to junior developers and team members.");

        d1.Save(p1);

        // ================= PAGE 2 =================
        ResumeDrawer d2 = new ResumeDrawer();

        string[] jbRemaining = new string[] {
            "Analyzed business requirements and designed Salesforce solutions using configuration and custom development.",
            "Customized Salesforce using Apex, LWC, SOQL, Flows, and Validation Rules.",
            "Developed custom Experience Cloud functionality using Salesforce technologies.",
            "Created and maintained technical documentation, solution designs, and data models.",
            "Created packages and performed package installation and testing.",
            "Conducted code reviews to ensure adherence to Salesforce coding standards and best practices.",
            "Developed Agentforce functionality and prompts using Prompt Builder.",
            "Implemented customized Agentforce responses using Flows and Salesforce automation."
        };
        foreach (string b in jbRemaining) { d2.DrawBullet(b); }
        d2.AddSpace(12f);

        d2.DrawProject("Project \u2013 MD Application", "Environment: Sales Cloud");
        string[] mdBullets = new string[] {
            "Collaborated with product managers and developers to design technical solutions.",
            "Participated in requirement analysis, development, testing, and deployment activities.",
            "Replaced legacy triggers with Salesforce Flows where appropriate to simplify automation and improve maintainability.",
            "Developed and optimized Apex Classes and Test Classes.",
            "Conducted code reviews and optimized Apex implementations.",
            "Deployed Salesforce changes using VS Code and source-driven development practices.",
            "Ensured required code coverage and deployment quality."
        };
        foreach (string b in mdBullets) { d2.DrawBullet(b); }
        d2.AddSpace(12f);

        d2.DrawProject("Project \u2013 Call Application", "Environment: Sales Cloud, Service Cloud");
        string[] callBullets = new string[] {
            "Collaborated with team members and developers to design and implement Salesforce solutions.",
            "Developed Apex Classes, Triggers, Batch Apex, and Lightning Web Components.",
            "Implemented Salesforce automation based on business requirements.",
            "Participated in package creation, installation, configuration, and testing.",
            "Created and maintained technical documentation and deployment guides.",
            "Supported debugging, testing, and production issue resolution."
        };
        foreach (string b in callBullets) { d2.DrawBullet(b); }
        d2.AddSpace(12f);

        d2.DrawProject("Project \u2013 ECA", "Environment: Sales Cloud, Service Cloud");
        string[] ecaBullets = new string[] {
            "Collaborated with the team to gather business requirements and translate them into technical specifications.",
            "Configured Profiles, Permission Sets, Users, Roles, and Queues based on access requirements.",
            "Implemented Salesforce security and access controls.",
            "Replaced legacy triggers with Flows where appropriate.",
            "Created Custom Objects, Fields, List Views, Profiles, Permission Sets, Queues, and Roles.",
            "Configured Validation Rules, Process Builder, and Flow Builder to automate business processes.",
            "Supported testing, deployment, troubleshooting, and production issue resolution."
        };
        foreach (string b in ecaBullets) { d2.DrawBullet(b); }
        d2.AddSpace(12f);

        d2.DrawBanner("SKILLS");
        string[] skills = new string[] {
            "Apex, Apex Triggers, Batch Apex, Asynchronous Apex, Test Classes, SOQL, SOSL, Lightning Web Components (LWC), Salesforce Flows, REST API, Web Services, External System Integration, Postman",
            "HTML, CSS, JavaScript, Salesforce Lightning Design System (SLDS)",
            "Sales Cloud, Service Cloud, Experience Cloud, Agentforce, Data Cloud, CPQ",
            "Agentforce Messaging, Agentforce Service Email, Prompt Builder, Agentforce Actions, AI-powered customer service automation",
            "VS Code, GitHub, Workbench, Apex Data Loader, Postman, Change Sets, Salesforce Extension",
            "Package Creation, Package Installation, Code Review, Debugging, Performance Optimization, Governor Limit Optimization, Deployment Management"
        };
        foreach (string s in skills) { d2.DrawBullet(s); }
        d2.AddSpace(12f);

        d2.DrawBanner("CERTIFICATIONS");
        string[] certs = new string[] {
            "Salesforce Certified Platform Administrator",
            "Salesforce Certified Platform Developer I",
            "Salesforce Certified Platform App Builder",
            "Salesforce Certified CPQ Administrator",
            "Salesforce Certified Agentforce Specialist",
            "Salesforce Certified AI Associate",
            "Salesforce Certified Associate"
        };
        foreach (string c in certs) { d2.DrawBullet(c); }
        d2.AddSpace(12f);

        d2.DrawBanner("EDUCATION");
        d2.DrawEducation("Bachelor of Engineering", "RTM Nagpur University, Nagpur, Maharashtra \u2014 Graduated: 2018");
        d2.DrawEducation("Diploma (Polytechnic)", "MSBTE, Nagpur, Maharashtra \u2014 Graduated: 2015");

        d2.Save(p2);
    }
}
"@

Add-Type -TypeDefinition $code -ReferencedAssemblies "System.Drawing.dll"

$p1 = "d:\Family\Nehal\Programming\portfolio_website\public\resume-1.png"
$p2 = "d:\Family\Nehal\Programming\portfolio_website\public\resume-2.png"

[ResumeDrawer]::GeneratePages($p1, $p2)

Write-Output "Successfully generated Page 1 and Page 2 PNG files with clean unicode bullets and dashes."
