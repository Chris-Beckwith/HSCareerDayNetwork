import { ButtonProps, Tooltip, useMediaQuery, useTheme } from "@mui/material"
import { upgradeText } from "../util/constants"
import AppButton from "./AppButton"
import { Lock } from "@mui/icons-material"

interface Props extends ButtonProps {
    label: string
    onClick: () => void
    canManage: boolean
}

export default function AppLockButton({label, onClick, canManage, ...props} : Props) {
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

    return (
        <Tooltip title={canManage ? '' : upgradeText}>
            <span>
                <AppButton {...props} onClick={() => onClick()} variant="contained" color="primary" disabled={!canManage}>
                    {!canManage &&
                        <Lock sx={{
                            position: 'absolute',
                            right: '2px',
                            top: '2px',
                            fontSize: isMobile ? '1.7rem' : '2rem',
                            opacity: 0.4,
                            color: 'inherit',
                            pointerEvents: 'none',
                        }} />
                    }
                    {label}
                </AppButton>
            </span>
        </Tooltip>
    )
}