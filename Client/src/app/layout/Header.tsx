import { AppBar, Box, Button, Fade, IconButton, List, ListItem, Menu, MenuItem, Toolbar, useMediaQuery, useTheme } from "@mui/material";
import { NavLink, useLocation, useNavigate } from "react-router-dom";
import { useAppSelector } from "../store/configureStore";
import SignedInMenu from "./SignedInMenu";
import { DarkMode, LightMode } from "@mui/icons-material";
import MenuIcon from '@mui/icons-material/Menu';
import React from "react";

const midLinks = [
    { title: 'Events', path: '/' },
    { title: 'Schools', path: '/schools' },
    { title: 'Careers', path: '/careers' },
    { title: 'Speakers', path: '/speakers' },
]

const rightLinks = [
    { title: 'Login', path: '/login' },
]

interface Props {
    darkMode: boolean
    handleThemeChange: () => void
}

/**
 * Header for the website
 */
export default function Header({ darkMode, handleThemeChange }: Props) {
    const { user } = useAppSelector(state => state.account)
    const navigate = useNavigate()
    const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null)
    const open = Boolean(anchorEl)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))
    
    const location = useLocation()

    const currentLink = midLinks.find(
        link => link.path === location.pathname
    )

    const handleClick = (event: React.MouseEvent<HTMLElement>) => {
        setAnchorEl(event.currentTarget);
    }

    const handleClose = () => {
        setAnchorEl(null);
    }

    const navStyles = {
        color: 'inherit',
        textDecoration: 'none',
        typography: isTablet ? 'subtitle2' : 'h6',
        fontSize: isTablet ? '1.05rem' : '1.25rem',
        '&:hover': { color: 'grey.500' },
        '&.active': { color: 'text.secondary' }
    }

    return (
        <AppBar position='static' sx={{ mb: 4, left: 0, right: 0 }}>
            <Toolbar sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <Box display='flex' alignItems='center'>
                    <img src="/images/NHSCDN-logo.png" alt="logo" 
                        style= {{ height: isTablet ? isMobile ? 70 : 90 : 110, marginTop: 5, marginBottom: 5 }} />
                </Box>

                {user?.roles?.includes("Admin") &&
                    (isMobile ? (
                        <>
                            <Button
                                onClick={handleClick}
                                sx={{typography: 'h6', minWidth: 0, color: 'text.secondary', '&:hover': { backgroundColor: '#757575' } }}
                            >
                                <MenuIcon sx={{ mr: 1 }}/>
                                {currentLink?.title}
                            </Button>
                            <Menu anchorEl={anchorEl} open={open} onClose={handleClose} TransitionComponent={Fade}>
                                {midLinks.map(({ title, path }) => (
                                    title != currentLink?.title &&
                                        <MenuItem key={path}
                                            onClick={() => {
                                                navigate(path);
                                                handleClose();
                                            }}
                                        >
                                            {title}
                                        </MenuItem>
                                ))}
                            </Menu>
                        </>
                    ) : (
                        <List sx={{ display: 'flex' }}>
                            {midLinks.map(({ title, path }) => (
                                <ListItem key={path} component={NavLink} to={path} sx={navStyles}>
                                    {title.toUpperCase()}
                                </ListItem>
                            ))}
                        </List>
                    ))}
                
                <Box sx={{ position: 'absolute', top: isMobile ? 20 : 0, right: isMobile ? 50 : 24 }}>
                    <IconButton sx={{  }} onClick={handleThemeChange}>
                        {darkMode ? <DarkMode /> : <LightMode />}
                    </IconButton>
                </Box>

                <Box display='flex' alignItems='center' sx={{ ml: -4 }}>
                    {user ? (
                        <SignedInMenu />
                    ) : (
                        <List sx={{ display: 'flex' }}>
                            {rightLinks.map(({ title, path }) => (
                                <ListItem
                                    component={NavLink}
                                    to={path}
                                    key={path}
                                    sx={navStyles}
                                >
                                    {title.toUpperCase()}
                                </ListItem>
                            ))}
                        </List>
                    )}
                </Box>
            </Toolbar>
        </AppBar>
    )
}