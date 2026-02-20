import { Button, Menu, Fade, MenuItem, useTheme, useMediaQuery } from "@mui/material";
import React from "react";
import { useAppDispatch, useAppSelector } from "../store/configureStore";
import { signOut } from "../../features/account/accountSlice";
import { useNavigate } from "react-router-dom";
import { AccountCircle, ArrowDropDown } from "@mui/icons-material";

/**
 * Drop down menu for signed in users, only available for admins.
 */

export default function SignedInMenu() {
    const navigate = useNavigate()
    const dispatch = useAppDispatch()
    const {user} = useAppSelector(state => state.account)
    const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null)
    const open = Boolean(anchorEl)
    const theme = useTheme()
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))
    
    const handleClick = (event: React.MouseEvent<HTMLElement>) => {
        setAnchorEl(event.currentTarget);
    }
    
    const handleClose = () => {
        setAnchorEl(null);
    }

    const handleRegister = () => {
        navigate('/register')
        handleClose()
    }

    const handleSchoolAdmins = () => {
        navigate('/schoolAdmins')
        handleClose()
    }

    return (
        <>
            <Button
                color="inherit"
                onClick={handleClick}
                sx={{typography: 'h6', minWidth: 0 }}
            >
                {isTablet ? <AccountCircle /> : user?.userName}
                {!isTablet && <ArrowDropDown />}
            </Button>
            <Menu
                anchorEl={anchorEl}
                open={open}
                onClose={handleClose}
                TransitionComponent={Fade}
            >
                {user?.roles?.includes("Admin") && (
                    [
                        <MenuItem key="1" onClick={handleRegister}>Register</MenuItem>,
                        <MenuItem key="2" onClick={handleSchoolAdmins}>School Admins</MenuItem>
                    ]
                )}
                <MenuItem onClick={() => dispatch(signOut())}>Logout</MenuItem>
            </Menu>
        </>
    );
}