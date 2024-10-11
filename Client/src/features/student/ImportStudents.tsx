import { Box, Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from "@mui/material";
import { ChangeEvent, useState } from "react";
import agent from "../../app/api/agent";
import { useAppDispatch } from "../../app/store/configureStore";
import { reloadStudents } from "./studentSlice";
import { LoadingButton } from "@mui/lab";

interface Props {
    open: boolean
    eventId: number
    setResponse: (response: string) => void
    handleClose: () => void
}

export default function ImportStudents({ open, eventId, setResponse, handleClose }: Props) {
    const [file, setFile] = useState<File | null>(null)
    const [errorMsg, setErrorMsg] = useState(null)
    const [loading, setLoading] = useState(false)
    const dispatch = useAppDispatch()

    const onFileChange = (e: ChangeEvent<HTMLInputElement>) => {
        setErrorMsg(null)
        if (e.target.files && e.target.files[0])
            setFile(e.target.files[0])
    }

    const onImport = async () => {
        setLoading(true)
        try {
            if (file) {
                setErrorMsg(null)
                setResponse('')
                const formData = new FormData()
                formData.append('file', file)
                await agent.Student.import(file, eventId)
                    .then(response => {
                        setResponse(response.message)
                    })
                dispatch(reloadStudents())
                handleClose()
            }
        } catch (e: any) {
            setErrorMsg(e.data.title)
        }
        setLoading(false)
    }

    const handleOnCancel = () => {
        setErrorMsg(null)
        handleClose()
    }

    return (
        <Dialog
            open={open}
            onClose={handleClose}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
        >
            <DialogTitle id="alert-dialog-title">
                Import Students
            </DialogTitle>
            <DialogContent>
                <DialogContentText id="alert-dialog-description">
                    Drag or Select file to import, file type must be .xlsx or .xls
                </DialogContentText>
                <Box sx={{ mt: 2 }}>
                    <input style={{ width: 450 }} type="file" accept=".xlsx, .xls" onChange={(event) => onFileChange(event)} />
                </Box>
                <Box>
                    {errorMsg &&
                        <DialogContentText sx={{ p: 2, width: 450 }} color="error">{errorMsg}</DialogContentText>
                    }
                </Box>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleOnCancel}>Cancel</Button>
                <LoadingButton onClick={onImport} disabled={!file} loading={loading} autoFocus>
                    Import Students
                </LoadingButton>
            </DialogActions>
        </Dialog>
    )
}