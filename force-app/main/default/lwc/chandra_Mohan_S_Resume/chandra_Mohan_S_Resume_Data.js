import Images from '@salesforce/resourceUrl/Chandra_Mohan_S_Resume_Img';

export const PROFILE_IMAGE =Images + '/MyResumeImages/Images/ChandraMohanS.png';
export const SOCIAL_LINKS=
[
    {
        type:"linkedin",
        label:"linkedin/ChandraMohanS",
        link:"https://www.linkedin.com/in/chandramohans07/",
        icon: Images + '/MyResumeImages/Images/linkedin.png'

    },
    {
        type:"github",
        label:"github/ChandraMohanS",
        link:"https://github.com/chanmsdian",
        icon: Images + '/MyResumeImages/Images/github.png'
    },
    {
        type:"trailhead",
        label:"trailhead/ChandraMohanS",
        link:"https://trailblazer.me/id/chandramohans07",
        icon: Images + '/MyResumeImages/Images/TrailHead.png'
    }
];
export const USER_DETAILS =
{
    NAME: "S Chandra Mohan",
    ROLE: "Salesforce Developer",
    EMAIL: "chandramohan131198@gmail.com",
    PHONE: "+91 868 196 5251"
}

export const CAREER_SUMMARY=
{
    HEADING: "CAREER SUMMARY",
    DESCRIPTION: "Motivated Software Developer with 2 years of progressive Agile and Salesforce development experience. A curious learner and creative team player, with practical expertise in meeting job demands and deadlines through a diligent work ethic and commitment to quality.",
    KEY_POINTS: 
    [
        "Harnessed Agile project management to develop the Lightning Salesforce Application.",
        "Resolved JIRA tickets with extensive bug fixes.",
        "Collaborated with team members to create and implement high-availability solutions based on client specifications.",
        "Outperformed expectations through effective prioritisation and a consistent work ethic.",
        "Software solution delivered in accordance with Product Roadmap, Release Plan Milestones, and Key Performance Indicators.",
        "Resolved customer queries and problems using effective communication and providing step-by-step solutions."
    ]
    
}   
export const EXPERIENCE_DATA =
{
    HEADING: "WORK EXPERIENCE",
    EXPERIENCES: 
    [
        {
            ROLE:"Associate Software Developer",
            COMPANY_NAME:"Accenture",
            DURATION:"January 2021 - Present",
            DESCRIPTION:"As a Junior Salesforce developer, I created a Salesforce Application for a pharmacy client to manage and track insurance claims, benefit verification, and customer coverage details. Based on client specifications, I used Configuration tools and Customization to create and implement high-availability solutions.",
            DESCRIPTION_POINTS:
            [
                "Requirement gathering, analysis and design effectively communicated with client to achieve the desired outcome.",
                "Created Validation rules, Formulas as required.",
                "Created Workflow rules to automate the task, to send email alerts.",
                "Created Custom objects and stored organization's data as per Business requirements.",
                "Implemented Fields, Page Layout, Record Types, Tabs, Dashboards, Email Templates, Reports, Sharing rules, Permission sets, Profile settings and other Salesforce Standard features.",
                "Created Aura and LWC pages to implement community sites in accordance with the requirements.",
                "Used Custom Labels to create multilingual application sites. "
            ],
            TECHNOLOGIES_USED:
            {
                HEADING:"TECHNOLOGIES USED",
                LIST: 
                [
                    "HTML",
                    "CSS",
                    "JavaScript",
                    "Apex",
                    "SOQL",
                    "SOSL",
                    "Triggers",
                    "Data Loader"
                ]
            },
            ROLES_AND_RESPONSIBILITIES:
            {
                HEADING:"ROLES & RESPONSIBILITIES",
                DETAILS:
                [
                "Requirement gathering, analysis, design, and effective communication with clients to achieve the desired results.",
                "Designed and developed LWC pages.",
                "Interacted with Business users and resolved bugs.",
                "Represented the team at the Scrum Ceremonies.",
                "Prepared Technical Documentation."
                ]
            }
        }
    ]
}

export const EDUCATION_DATA =
{
    ICON: Images + '/MyResumeImages/Images/education.png',
    HEADING: "EDUCATION",
    LIST:
    [
        {
            NAME: "B.Tech - Information Technology.",
            UNIVERSITY_NAME: "SRM VAlliammai Engineering College, Chennai, Tamil Nadu.",
            CGPA: "CGPA: 6.40.",
            DURATION: "2016-2020."
        },
        {
            NAME: "HSC.",
            UNIVERSITY_NAME: "Jaigopal Garodia National Higher Secondary School, Chennai, Tamil Nadu.",
            CGPA: "Percentage: 73.08%.",
            DURATION: "2015-2016."
        },
        {
            NAME: "SSLC.",
            UNIVERSITY_NAME: "Sri Sankara Vidyalaya Matriculation Higher Secondary School, Chennai, Tamil Nadu.",
            CGPA: "Percentage: 88.00%.",
            DURATION: "2013-2014."
        }
    ]
}

export const CERTIFICATIONS_DATA=
{
    HEADING:"CERTIFICATIONS",
    CERT_LIST:
    [
        {
            NAME: "Salesforce Certified Administrator",
            ICON: Images + '/MyResumeImages/Images/AdminImage.png'
        },
        {
            NAME: "Salesforce Certified Platform App Builder",
            ICON: Images + '/MyResumeImages/Images/AppBuilderImage.jpg'
        },
        {
            NAME: "Salesforce Certified Platform Developer 1",
            ICON: Images + '/MyResumeImages/Images/PD1Image.png'
        },
        {
            NAME: "JavaScript Algorithms & DS",
            ICON: Images + '/MyResumeImages/Images/JavaScript.png'
        },
        {
            NAME: "Responsive Web Design",
            ICON: Images + '/MyResumeImages/Images/JavaScript.png'
        }
    ]
}
export const LANGUAGE_DATA = 
{
    HEADING: "Languages",
    LIST:
    [
        {
            NAME: "English",
            LEVEL: "Professional"
        },
        {
            NAME: "Tamil",
            LEVEL: "Native"
        }
    ]
}
export const SKILLS_DATA = 
{
    HEADING: "SKILLS",
    SKILLS:
    [
        {
            HEADING: "TECHNICAL SKILLS",
            SKILLS_LIST:
            [
                {NAME: "HTML"},
                {NAME: "CSS"},
                {NAME: "JavaScript"},
                {NAME: "Lightning Web Components"},
                {NAME: "Lightning Aura Components"},
                {NAME: "Angular"},
                {NAME: "Apex"},
                {NAME: "SOQL"},
                {NAME: "SOSL"},
                {NAME: "Work Bench"},
                {NAME: "Data Loader"}
            ],
        },
        {
            HEADING: "SOFT SKILLS",
            SKILLS_LIST:
            [
                {NAME: "JIRA"},
                {NAME: "Azure Devops"},
                {NAME: "Git"},
                {NAME: "Confluence"},
                {NAME: "Agile"},
                {NAME: "Project Documentation"},
                {NAME: "Requirement Gathering"},
                {NAME: "Time Management"}
            ],
        },
    ]
}

export const INTEREST_DATA = 
{
    HEADING: "INTEREST & HOBBIES",
    LIST:
    [
        "Cricket","Body Building", "Listening to Music"
    ]
}