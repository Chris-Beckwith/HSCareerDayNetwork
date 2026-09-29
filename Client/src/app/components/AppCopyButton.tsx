import { Check, ContentCopy } from "@mui/icons-material";
import { IconButton } from "@mui/material";
import { useState } from "react";

interface Props {
    copyText: string
}

export default function AppCopyButton({copyText}: Props) {

    const [copied, setCopied] = useState(false)

    const handleCopy = async () => {
        try {
            await navigator.clipboard.writeText(copyText)
            setCopied(true)
            setTimeout(() => setCopied(false), 2000)
        } catch (err) {
            console.log("Failed to copy text: ", err)
        }
    }

    return (
        <>
            {copied ?
                <IconButton disableRipple>
                    <Check color="primary" />
                </IconButton>
                :
                <IconButton onClick={handleCopy}>
                    <ContentCopy color="primary" />
                </IconButton>
            }
        </>
    )
}