export class ExcelResponse<T> {
    file: T
    fileName: string
    contentType: string

    constructor(file: T, fileName: string, contentType: string) {
        this.file = file
        this.fileName = fileName
        this.contentType = contentType
    }
}