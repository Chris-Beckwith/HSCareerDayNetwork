import React from "react"
import { IMaskInput } from "react-imask"

/**
 * Generic Mask Input
 * 
 * Currently only used for phone numbers so will need to handle
 * normalizedValue if that changes.
 */
export const MaskedNumberInput = React.forwardRef<HTMLInputElement, any>(
    function MaskedNumberInput(props, ref) {
        const { onChange, mask, ...other } = props

        return (
            <IMaskInput
                {...other}
                mask={mask}
                min={0}
                thousandsSeparator=","
                inputRef={ref}
                overwrite
                onAccept={(value: string) => {
                    //I've combined phone number and ext, this handles for removing the x that I add.
                    onChange({
                        target: {
                            name: other.name,
                            value: value
                        }
                    })
                }}
            />
        )
    }
)