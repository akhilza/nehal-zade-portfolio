// Portfolio data for Nehal Zade - Salesforce Developer

export interface NavLink {
  label: string;
  href: string;
}

export type SkillCategory =
  | "Platforms"
  | "AI & Agentforce"
  | "Development"
  | "Automation"
  | "Integrations"
  | "Data & Security";

export interface Skill {
  symbol: string;
  name: string;
  category: SkillCategory;
  level: number; // proficiency %
}

export interface TimelineEvent {
  year: string;
  type: "education" | "experience" | "certification";
  title: string;
  org: string;
  period: string;
  badge?: string;
  note?: string;
  tags?: string[];
  credentialId?: string;
  points: string[];
}

export interface Achievement {
  value: number;
  suffix: string;
  label: string;
  detail: string;
  size: "lg" | "md" | "sm";
}

export interface Project {
  title: string;
  kind: "Professional" | "Personal";
  org: string;
  period: string;
  blurb: string;
  highlights: string[];
  metric?: string;
  tags: string[];
  href?: string;
}

export interface Certification {
  name: string;
  issuer: string;
  date: string;
  id: string;
}

export const profile = {
  name: "Nehal Zade",
  firstName: "Nehal",
  monogram: "NZ",
  role: "Salesforce Developer",
  tagline: "Apex • LWC • Agentforce • Salesforce Data Cloud",
  photo: "/avatar.svg",
  badgePhoto: "/me.png",
  email: "nehalsyzade07@gmail.com",
  phone: "+91 7898884522",
  location: "Nagpur, Maharashtra, India",
  bio: "Salesforce Certified Developer with 4+ years of experience designing, developing, testing and deploying scalable solutions on the Salesforce Lightning platform. Expertise in Apex (Triggers, Batch, Queueable, Schedulable), Lightning Web Components (LWC), Salesforce Flows, SOQL/SOSL and REST/SOAP API integrations. Hands-on with Agentforce (Generative AI, Prompt Builder, Agentforce Messaging, Agentforce Service Email), Salesforce Data Cloud, Service Cloud, Sales Cloud, Experience Cloud and Salesforce CPQ. Holds 7 Salesforce certifications with expertise in bulkified architecture, Governor Limits compliance, and 88%+ unit test coverage.",
  links: {
    resume: "/Nehal_Zade_Resume.pdf",
    linkedin: "https://linkedin.com/in/nehal-zade-a37709233",
    trailblazer: "https://trailblazer.me/id/nehal04",
    github: "https://trailblazer.me/id/nehal04",
    portfolio: "#",
  },
  facts: [
    { label: "Based in", value: "Nagpur, India" },
    { label: "Degree", value: "B.E. (Bachelor of Engineering)" },
    { label: "Graduated", value: "2018 · RTM Nagpur University" },
    { label: "Status", value: "Available · Immediate joiner" },
    { label: "Focus", value: "Apex · LWC · Agentforce · Data Cloud" },
  ],
  quote: "Architecting scalable enterprise solutions on the Salesforce Lightning platform.",
  stats: [
    { value: "4+", label: "Years experience" },
    { value: "7", label: "Salesforce certifications" },
    { value: "88%+", label: "Code coverage" },
  ],
};

export const navLinks: NavLink[] = [
  { label: "About", href: "#about" },
  { label: "Skills", href: "#skills" },
  { label: "Work", href: "#work" },
  { label: "Experience", href: "#experience" },
  { label: "Achievements", href: "#achievements" },
  { label: "Contact", href: "#contact" },
];

export const skillCategories: SkillCategory[] = [
  "Platforms",
  "AI & Agentforce",
  "Development",
  "Automation",
  "Integrations",
  "Data & Security",
];

export const skills: Skill[] = [
  // Platforms
  { symbol: "Sl", name: "Salesforce Lightning", category: "Platforms", level: 96 },
  { symbol: "Sc", name: "Service Cloud", category: "Platforms", level: 93 },
  { symbol: "Sa", name: "Sales Cloud", category: "Platforms", level: 92 },
  { symbol: "Ex", name: "Experience Cloud", category: "Platforms", level: 90 },
  { symbol: "Cq", name: "Salesforce CPQ", category: "Platforms", level: 88 },
  { symbol: "Dc", name: "Data Cloud", category: "Platforms", level: 91 },

  // AI & Agentforce
  { symbol: "Ag", name: "Agentforce", category: "AI & Agentforce", level: 94 },
  { symbol: "Ai", name: "Generative AI", category: "AI & Agentforce", level: 91 },
  { symbol: "Pb", name: "Prompt Builder", category: "AI & Agentforce", level: 93 },
  { symbol: "Am", name: "Agentforce Messaging", category: "AI & Agentforce", level: 90 },
  { symbol: "Mg", name: "Model Grounding", category: "AI & Agentforce", level: 89 },
  { symbol: "Au", name: "Autonomous Agents", category: "AI & Agentforce", level: 88 },

  // Development
  { symbol: "Ap", name: "Apex Classes", category: "Development", level: 96 },
  { symbol: "Tr", name: "Apex Triggers", category: "Development", level: 96 },
  { symbol: "Ba", name: "Batch & Queueable", category: "Development", level: 94 },
  { symbol: "Lw", name: "LWC Components", category: "Development", level: 95 },
  { symbol: "Lm", name: "LMS & Aura", category: "Development", level: 88 },
  { symbol: "Js", name: "JavaScript & SLDS", category: "Development", level: 91 },

  // Automation
  { symbol: "Fl", name: "Salesforce Flows", category: "Automation", level: 96 },
  { symbol: "Rf", name: "Record-Triggered Flow", category: "Automation", level: 96 },
  { symbol: "Sf", name: "Screen & Scheduled", category: "Automation", level: 93 },
  { symbol: "Ap", name: "Approval Processes", category: "Automation", level: 90 },
  { symbol: "Vr", name: "Validation Rules", category: "Automation", level: 92 },
  { symbol: "Pm", name: "Process to Flow", category: "Automation", level: 94 },

  // Integrations
  { symbol: "Ra", name: "REST APIs", category: "Integrations", level: 95 },
  { symbol: "Sp", name: "SOAP Web Services", category: "Integrations", level: 88 },
  { symbol: "Wh", name: "HTTP Callouts & Hooks", category: "Integrations", level: 92 },
  { symbol: "Nc", name: "Named Credentials", category: "Integrations", level: 90 },
  { symbol: "Ca", name: "Connected Apps", category: "Integrations", level: 89 },
  { symbol: "Pm", name: "Postman", category: "Integrations", level: 93 },

  // Data & Security
  { symbol: "Sq", name: "SOQL & SOSL", category: "Data & Security", level: 95 },
  { symbol: "Dm", name: "Data Model Objects", category: "Data & Security", level: 91 },
  { symbol: "Ow", name: "OWD & Role Hierarchy", category: "Data & Security", level: 92 },
  { symbol: "Fl", name: "FLS & Permission Sets", category: "Data & Security", level: 94 },
  { symbol: "Gl", name: "Governor Limits", category: "Data & Security", level: 95 },
  { symbol: "Tc", name: "Apex Test Coverage", category: "Data & Security", level: 95 },
];

export const projects: Project[] = [
  {
    title: "Netanders — AI Customer Support & Data Unification",
    kind: "Professional",
    org: "MODV India Pvt Ltd",
    period: "Apr 2024 — Present",
    blurb: "End-to-end implementation of Service Cloud and Agentforce AI customer support with Salesforce Data Cloud harmonization.",
    highlights: [
      "Led end-to-end implementation of Service Cloud and Agentforce messaging, automating case intake, categorization and routing",
      "Configured Data Cloud Data Streams to bring customer interaction history and cross-platform engagement data into prompt templates",
      "Built custom LWC components in Service Console so support agents can review AI reasoning and override bot responses",
      "Automated 40% of tier-1 support inquiries and cut response latency by 35%",
    ],
    metric: "−35% latency",
    tags: ["Service Cloud", "Agentforce", "Data Cloud", "Apex", "LWC", "REST API"],
  },
  {
    title: "JB — B2B E-Commerce & CPQ Solution",
    kind: "Professional",
    org: "Perigeon Software",
    period: "Jun 2022 — Mar 2024",
    blurb: "Scalable Salesforce CPQ pricing engine, custom product bundles and Experience Cloud portal for a global distributor.",
    highlights: [
      "Configured Salesforce CPQ product bundles, pricing rules, discount schedules and quote templates for a global B2B distributor",
      "Built custom ordering flows and product catalog search on Experience Cloud using LWC",
      "Automated quote approval matrix with Record-Triggered Flows, speeding up quote turnaround by 50%",
      "Engineered Batch Apex and Schedulable Apex jobs processing 50,000+ daily transactions with automated alerts",
    ],
    metric: "−50% turnaround",
    tags: ["Sales Cloud", "Salesforce CPQ", "Experience Cloud", "Apex", "Flows", "LWC"],
  },
  {
    title: "Data Cloud Customer 360",
    kind: "Professional",
    org: "MODV India Pvt Ltd",
    period: "Apr 2024 — Present",
    blurb: "Ingesting and harmonizing high-volume external data into Salesforce Data Cloud for real-time customer profiles.",
    highlights: [
      "Configured Data Streams, Data Model Objects (DMOs) and calculated insights for unified customer intelligence",
      "Grounded Generative AI models in Prompt Builder with real-time CRM and Data Cloud profile attributes",
      "Optimized SOQL/SOSL queries, selective indexing and heap size on objects with 500,000+ records, lifting query speed by 30%",
    ],
    metric: "500k+ records",
    tags: ["Data Cloud", "DMOs", "Prompt Builder", "SOQL Tuning", "Agentforce"],
  },
  {
    title: "Experience Cloud Self-Service Portal",
    kind: "Professional",
    org: "Perigeon Software",
    period: "Jun 2022 — Mar 2024",
    blurb: "Customer self-service portals on Experience Cloud utilizing Lightning Web Components and SLDS styling.",
    highlights: [
      "Built responsive, accessible self-service interfaces with LWC and Salesforce Lightning Design System (SLDS)",
      "Reduced incoming tier-1 support tickets by 20% through automated knowledge base search and case submission",
      "Implemented Lightning Message Service (LMS) and custom events for seamless cross-component communication",
    ],
    metric: "−20% tickets",
    tags: ["Experience Cloud", "LWC", "SLDS", "LMS", "JavaScript"],
  },
  {
    title: "Enterprise ERP & Third-Party Integration",
    kind: "Professional",
    org: "Perigeon Software",
    period: "Jun 2022 — Mar 2024",
    blurb: "Custom bi-directional REST APIs and webhooks synchronizing accounts, billing, and inventory between ERP and Salesforce.",
    highlights: [
      "Engineered secure HTTP Callouts with Named Credentials, Connected Apps and OAuth 2.0 authorization",
      "Implemented resilient error handling and transaction logging for Batch and Schedulable Apex jobs",
      "Designed executive Reports and Dashboards for real-time pipeline, conversion rates and case SLA tracking",
    ],
    metric: "50k+ daily txns",
    tags: ["REST API", "SOAP", "Webhooks", "Named Credentials", "Postman", "Batch Apex"],
  },
  {
    title: "Single-Flow-Per-Object Automation Suite",
    kind: "Professional",
    org: "MODV India Pvt Ltd",
    period: "Apr 2024 — Present",
    blurb: "Architecture overhaul migrating legacy Process Builders and Workflow Rules into high-performance Salesforce Flows.",
    highlights: [
      "Designed and deployed single-flow-per-object Record-Triggered Flows with before-save and after-save optimization",
      "Authored Apex test classes with comprehensive test data factories and mock HTTP callouts, achieving 88%+ code coverage",
      "Enforced peer code reviews, Governor Limits compliance, and SFDX deployment standards",
    ],
    metric: "88%+ coverage",
    tags: ["Salesforce Flows", "Apex Triggers", "SFDX", "Governor Limits", "Unit Testing"],
  },
];

export const timeline: TimelineEvent[] = [
  {
    year: "2024",
    type: "experience",
    title: "Salesforce Developer",
    org: "MODV India Pvt Ltd",
    period: "April 2024 — Present",
    badge: "Current · Remote",
    points: [
      "Architect and deploy AI-driven customer service solutions using Salesforce Agentforce, Agentforce Messaging and Service Email, automating 40% of tier-1 support",
      "Configure and refine Generative AI prompts in Prompt Builder, grounding them with real-time CRM and Data Cloud assets to reduce latency by 35%",
      "Ingest, harmonize and transform high-volume external data into Salesforce Data Cloud, building DMOs for real-time customer 360",
      "Develop modular Lightning Web Components (LWC) with custom events and Lightning Message Service (LMS)",
      "Maintain 88%+ Apex code coverage with test data factories and mock callouts in an Agile/Scrum environment",
    ],
    tags: ["Agentforce", "Data Cloud", "Prompt Builder", "LWC", "Apex", "Flows", "Service Cloud"],
  },
  {
    year: "2022",
    type: "experience",
    title: "Salesforce Developer",
    org: "Perigeon Software (formerly Intforce Software)",
    period: "June 2022 — March 2024",
    badge: "CPQ · LWC · Flows",
    points: [
      "Delivered scalable Salesforce solutions across Sales Cloud, Service Cloud, and Experience Cloud for enterprise clients",
      "Built custom REST API integrations and webhook listeners to synchronize accounts, inventory and billing with ERP systems",
      "Engineered Batch Apex and Schedulable Apex jobs processing 50,000+ daily transactions with error handling and automated alerts",
      "Configured Salesforce CPQ product bundles, pricing rules, discount schedules and quote approval workflows",
    ],
    tags: ["Sales Cloud", "Service Cloud", "Salesforce CPQ", "Experience Cloud", "Batch Apex", "REST API"],
  },
  {
    year: "2018",
    type: "education",
    title: "Bachelor of Engineering (B.E.)",
    org: "Rashtrasant Tukadoji Maharaj (RTM) Nagpur University",
    period: "Graduated 2018",
    badge: "B.E. Engineering",
    points: [
      "Nagpur, Maharashtra, India",
      "Strong engineering foundation in computational methods, algorithms, and software problem solving",
    ],
  },
  {
    year: "2015",
    type: "education",
    title: "Diploma (Polytechnic)",
    org: "MSBTE, Nagpur, Maharashtra",
    period: "Graduated 2015",
    badge: "Diploma",
    points: [
      "Nagpur, Maharashtra, India",
      "Foundation in engineering principles, hardware-software concepts, and technical problem solving",
    ],
  },
];

export const achievements: Achievement[] = [
  { value: 4, suffix: "+", label: "Years of experience", detail: "Specialized in Lightning, Apex, LWC, Agentforce & Data Cloud", size: "lg" },
  { value: 7, suffix: "", label: "Salesforce Certifications", detail: "PD1, App Builder, Admin, Agentforce Specialist, CPQ, etc.", size: "md" },
  { value: 88, suffix: "%+", label: "Code Coverage", detail: "Unit testing with test data factories & mock callouts", size: "sm" },
  { value: 40, suffix: "%", label: "Tier-1 Inquiries Automated", detail: "Agentforce Messaging & Service Email resolution", size: "sm" },
  { value: 35, suffix: "%", label: "Faster Response Latency", detail: "Prompt Builder AI grounding with Data Cloud", size: "md" },
  { value: 50, suffix: "%", label: "Faster Quote Turnaround", detail: "CPQ quote approvals automated with Record-Triggered Flows", size: "md" },
];

export const certifications: Certification[] = [
  { name: "Salesforce Certified Agentforce Specialist", issuer: "Salesforce", date: "2024", id: "SF-AGENTFORCE-SPEC" },
  { name: "Salesforce Certified Platform Developer I (PDI)", issuer: "Salesforce", date: "2024", id: "SF-PDI-DEV" },
  { name: "Salesforce Certified Platform App Builder", issuer: "Salesforce", date: "2023", id: "SF-APP-BUILDER" },
  { name: "Salesforce Certified CPQ Administrator", issuer: "Salesforce", date: "2023", id: "SF-CPQ-ADMIN" },
  { name: "Salesforce Certified AI Associate", issuer: "Salesforce", date: "2024", id: "SF-AI-ASSOC" },
  { name: "Salesforce Certified Platform Administrator", issuer: "Salesforce", date: "2023", id: "SF-ADMIN-201" },
  { name: "Salesforce Certified Associate", issuer: "Salesforce", date: "2022", id: "SF-ASSOC" },
];

// Technical specifications shown in the skill popup
export const skillVersions: Record<string, string> = {
  "Salesforce Lightning": "Spring '25 / Winter '25",
  "Service Cloud": "Omni-Channel · Console",
  "Sales Cloud": "Enterprise Edition",
  "Experience Cloud": "LWR · Aura Sites",
  "Salesforce CPQ": "SteelBrick · Rules",
  "Data Cloud": "Customer 360 · DMOs",
  Agentforce: "Generative AI Agents",
  "Generative AI": "Prompt Engineering",
  "Prompt Builder": "Model Grounding",
  "Agentforce Messaging": "Service Email · Web",
  "Model Grounding": "CRM & Data Cloud",
  "Autonomous Agents": "Agent Actions",
  "Apex Classes": "API 60+ (Async / Bulk)",
  "Apex Triggers": "One-Trigger-Per-Object",
  "Batch & Queueable": "50,000+ Daily Txns",
  "LWC Components": "ES6+ · Shadow DOM",
  "LMS & Aura": "Pub/Sub Messaging",
  "JavaScript & SLDS": "Lightning Design System",
  "Salesforce Flows": "Record / Screen / Schedule",
  "Record-Triggered Flow": "Optimized Execution",
  "Screen & Scheduled": "Guided & Batch Actions",
  "Approval Processes": "Multi-Step Matrices",
  "Validation Rules": "Regex & Cross-Object",
  "Process to Flow": "Migration Strategy",
  "REST APIs": "Custom Apex REST / JSON",
  "SOAP Web Services": "WSDL · Integration",
  "HTTP Callouts & Hooks": "External ERP Sync",
  "Named Credentials": "OAuth 2.0 / JWT Bearer",
  "Connected Apps": "Consumer Keys · Scopes",
  Postman: "v10 Collection Runner",
  "SOQL & SOSL": "Indexing & Query Tuning",
  "Data Model Objects": "Data Streams & DMOs",
  "OWD & Role Hierarchy": "Enterprise Sharing",
  "FLS & Permission Sets": "Permission Set Groups",
  "Governor Limits": "Heap · SOQL · CPU Tuning",
  "Apex Test Coverage": "88%+ Coverage",
};
