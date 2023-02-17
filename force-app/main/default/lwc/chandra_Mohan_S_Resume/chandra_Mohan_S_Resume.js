import { LightningElement } from "lwc";
import * as RESUME_DATA from "./chandra_Mohan_S_Resume_Data";
import { loadScript } from "lightning/platformResourceLoader";
import downloadjs from "@salesforce/resourceUrl/downloadjs";
import downloadPDF from "@salesforce/apex/ResumePrintPDF.getPdfFileAsBase64String";
export default class Chandra_Mohan_S_Resume extends LightningElement {
    SOCIAL_LINKS = RESUME_DATA.SOCIAL_LINKS;
    PROFILE_IMAGE = RESUME_DATA.PROFILE_IMAGE;
    RESUME_DATA = RESUME_DATA;
    boolShowSpinner = false;
    pdfString;
    generatePdf() {
        this.boolShowSpinner = true;
        downloadPDF({})
            .then((response) => {
                console.log(response);
                this.boolShowSpinner = false;
                var strFile = "data:application/pdf;base64," + response;
                window.download(strFile, "sample.pdf", "application/pdf");
            })
            .catch((error) => {
                console.log("Error: " + error.body.message);
            });
    }
    renderedCallback() {
        loadScript(this, downloadjs)
            .then(() => console.log("Loaded download.js"))
            .catch((error) => console.log(error));
    }
}