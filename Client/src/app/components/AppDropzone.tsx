import { UploadFile } from '@mui/icons-material'
import { FormControl, FormHelperText, Typography, useMediaQuery, useTheme } from '@mui/material'
import { useCallback } from 'react'
import { useDropzone } from 'react-dropzone'
import { useController, UseControllerProps } from 'react-hook-form'

interface Props extends UseControllerProps {
    descriptionText: string
}

/**
 * Dropzone component for adding images
 */
export default function AppDropzone({ descriptionText, ...props }: Props) {
    const { fieldState, field } = useController({ ...props, defaultValue: null })
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    const dzStyles = {
        display: 'flex',
        border: 'dashed 3px #a3a3a3',
        borderColor: '#a3a3a3',
        borderRadius: '5px',
        paddingTop: '30px',
        alignItems: 'center',
        height: isTablet ? isMobile ? 150 : 175 : 200,
        width: isTablet ? isMobile ? 205 : 250 : 350,
    }

    const dzActive = {
        borderColor: 'green'
    }

    const onDrop = useCallback((acceptedFiles: any[]) => {
        acceptedFiles[0] = Object.assign(acceptedFiles[0], 
            {preview: URL.createObjectURL(acceptedFiles[0])})
        field.onChange(acceptedFiles[0])
    }, [field])

    const { getRootProps, getInputProps, isDragActive } = useDropzone({ onDrop })

    return (
        <div {...getRootProps()}>
            <FormControl style={isDragActive ? {...dzStyles, ...dzActive} : dzStyles}>
                <input {...getInputProps()} />
                <UploadFile sx={{fontSize: isTablet ? isMobile ? '50px' : '75px' : '100px'}} />
                <Typography variant={isTablet ? isMobile ? 'h6' : 'h5' : 'h4'}>{descriptionText}</Typography>
                <FormHelperText>{fieldState.error?.message}</FormHelperText>
            </FormControl>
        </div>
    )
}