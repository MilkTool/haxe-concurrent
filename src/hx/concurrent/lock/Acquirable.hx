/*
 * Copyright (c) 2016-2018 Vegard IT GmbH, https://vegardit.com
 * SPDX-License-Identifier: Apache-2.0
 */
package hx.concurrent.lock;

/**
 * @author Sebastian Thomschke, Vegard IT GmbH
 */
interface Acquirable {

    public var availablePermits(get, never):Int;

    /**
     * Blocks until a permit can be acquired.
     */
    public function acquire():Void;

    /**
     * By default this call is non-blocking, meaning if the object cannot be aqcuired currently `false` is returned immediately.
     *
     * If <code>timeoutMS</code> is set to value > 0, results in blocking for the given time to aqcuire the object.
     * If <code>timeoutMS</code> is set to value lower than 0, results in an exception.
     *
     * @return `false` if lock could not be acquired
     */
    public function tryAcquire(timeoutMS:Int = 0):Bool;

    /**
     * Releases one permit.
     *
     * Depending on the implementation this method may throw an exception if the current thread doesn't hold the permit.
     */
    public function release():Void;

}