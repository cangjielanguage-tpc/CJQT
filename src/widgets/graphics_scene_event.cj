/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

import cjqt.core.QEvent

//foregin function 
foreign func nativeGraphicsSceneEventDelete(ptr: Int64): Unit

/**
 * The class is QGraphicsSceneEvent
 * @author helin
 */
public open class QGraphicsSceneEvent <: QEvent {
    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super(ptr)
    }
}
