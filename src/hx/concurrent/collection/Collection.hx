/*
 * Copyright (c) 2016-2018 Vegard IT GmbH, https://vegardit.com
 * SPDX-License-Identifier: Apache-2.0
 */
package hx.concurrent.collection;

import hx.concurrent.internal.Either3;

/**
 * @author Sebastian Thomschke, Vegard IT GmbH
 */
interface Collection<T> {

    var length(get, never):Int;

    function add(x:T):Void;
    function addIfAbsent(x:T):Bool;
    function addAll(coll:Either3<Collection<T>, Array<T>, List<T>>):Void;
    function clear():Void;
    function remove(x:T):Bool;

    function contains(x:T):Bool;
    function isEmpty():Bool;

    function iterator():Iterator<T>;
    function filter(fn:T->Bool):Collection<T>;
    function map<X>(fn:T->X):Collection<X>;

    function copy():Collection<T>;
    function toArray():Array<T>;
    function toString():String;
    function join(sep:String):String;
}

