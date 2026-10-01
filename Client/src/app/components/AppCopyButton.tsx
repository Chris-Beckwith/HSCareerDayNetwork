import { Check, ContentCopy } from "@mui/icons-material";
import { IconButton, Tooltip } from "@mui/material";
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
                <Tooltip title="Copied">
                    <IconButton disableRipple>
                        <Check color="primary" />
                    </IconButton>
                </Tooltip>
                :
                <Tooltip title="Copy Text">
                    <IconButton onClick={handleCopy}>
                        <ContentCopy color="primary" />
                    </IconButton>
                </Tooltip>
            }
        </>
    )
}