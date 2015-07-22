# [php-fmt](https://github.com/dericofilho/php.tools) support for Atom

php.fmt, php.tools and php.oracle aim to help PHP development.

### Installation

#### Requirements
- **You must have a running copy of PHP on the machine you are running Atom**
- **You must have a copy of fmt.phar on the machine you are running Atom**

Plugin runs with PHP 5.6 or newer installed in the machine running the plugin.

There is a backwards compatible mode with PHP 5.5 - however not all improvements will be available in this mode.

**The following features are available through command palette (`ctrl+shift+P` or `cmd+shift+P`) :**

 *  phpfmt: format now
 *  phpfmt: disable space around exclamation mark - Laravel Only
 *  phpfmt: indentation with spaces
 *  phpfmt: toggle additional transformations
 *  phpfmt: toggle excluded transformations
 *  phpfmt: toggle skip execution when .php.tools.ini is missing
 *  phpfmt: toggle auto align
 *  phpfmt: toggle autocomplete
 *  phpfmt: toggle CakePHP style (experimental)
 *  phpfmt: toggle dependency autoimport
 *  phpfmt: toggle format on save
 *  phpfmt: toggle Laravel style (deprecated)
 *  phpfmt: toggle php.vet
 *  phpfmt: toggle PSR1 - Class and Methods names
 *  phpfmt: toggle PSR1
 *  phpfmt: toggle PSR2
 *  phpfmt: toggle smart linebreak after open curly
 *  phpfmt: toggle visibility order
 *  phpfmt: toggle yoda mode
 *  phpfmt: analyse this
 *  phpfmt: build autocomplete database
 *  phpfmt: getter and setter (camelCase)
 *  phpfmt: getter and setter (Go)
 *  phpfmt: getter and setter (snake_case)
 *  phpfmt: generate PHPDoc block
 *  phpfmt: look for .php.tools.ini
 *  phpfmt: order method within classes
 *  phpfmt: refactor
 *  phpfmt: toggle PHP 5.5 compatibility mode
 *  phpfmt: troubleshoot information


### Currently Supported Transformations:

 * AddMissingParentheses             Add extra parentheses in new instantiations.
 * AliasToMaster                     Replace function aliases to their masters - only basic syntax alias.
 * AlignDoubleArrow                  Vertically align T_DOUBLE_ARROW (=>).
 * AlignDoubleSlashComments          Vertically align "//" comments.
 * AlignEquals                       Vertically align "=".
 * AlignGroupDoubleArrow             Vertically align T_DOUBLE_ARROW (=>) by line groups.
 * AlignPHPCode                      Align PHP code within HTML block.
 * AlignTypehint                     Vertically align "//" comments.
 * AllmanStyleBraces                 Transform all curly braces into Allman-style.
 * AutoPreincrement                  Automatically convert postincrement to preincrement.
 * AutoSemicolon                     Add semicolons in statements ends.
 * CakePHPStyle                      Applies CakePHP Coding Style
 * ClassToSelf                       "self" is preferred within class, trait or interface.
 * ClassToStatic                     "static" is preferred within class, trait or interface.
 * ConvertOpenTagWithEcho            Convert from "<?=" to "<?php echo ".
 * DocBlockToComment                 Replace docblocks with regular comments when used in non structural elements.
 * DoubleToSingleQuote               Convert from double to single quotes.
 * EncapsulateNamespaces             Encapsulate namespaces with curly braces
 * GeneratePHPDoc                    Automatically generates PHPDoc blocks
 * IndentTernaryConditions           Applies indentation to ternary conditions.
 * JoinToImplode                     Replace implode() alias (join() -> implode()).
 * LeftWordWrap                      Word wrap at 80 columns - left justify.
 * LongArray                         Convert short to long arrays.
 * MergeElseIf                       Merge if with else.
 * MergeNamespaceWithOpenTag         Ensure there is no more than one linebreak before namespace
 * MildAutoPreincrement              Automatically convert postincrement to preincrement. (Deprecated pass. Use AutoPreincrement instead).
 * OrderMethod                       Sort methods within class in alphabetic order.
 * OrderMethodAndVisibility          Sort methods within class in alphabetic and visibility order .
 * PrettyPrintDocBlocks              Prettify Doc Blocks
 * PSR2EmptyFunction                 Merges in the same line of function header the body of empty functions.
 * PSR2MultilineFunctionParams       Break function parameters into multiple lines.
 * ReindentSwitchBlocks              Reindent one level deeper the content of switch blocks.
 * RemoveUseLeadingSlash             Remove leading slash in T_USE imports.
 * ReplaceBooleanAndOr               Convert from "and"/"or" to "&&"/"||". Danger! This pass leads to behavior change.
 * ReplaceIsNull                     Replace is_null($a) with null === $a.
 * ReturnNull                        Simplify empty returns.
 * ShortArray                        Convert old array into new array. (array() -> [])
 * SmartLnAfterCurlyOpen             Add line break when implicit curly block is added.
 * SpaceAroundControlStructures      Add space around control structures.
 * SpaceBetweenMethods               Put space between methods.
 * StrictBehavior                    Activate strict option in array_search, base64_decode, in_array, array_keys, mb_detect_encoding. Danger! This pass leads to behavior change.
 * StrictComparison                  All comparisons are converted to strict. Danger! This pass leads to behavior change.
 * StripExtraCommaInArray            Remove trailing commas within array blocks
 * StripNewlineAfterClassOpen        Strip empty lines after class opening curly brace.
 * StripNewlineAfterCurlyOpen        Strip empty lines after opening curly brace.
 * StripSpaces                       Remove all empty spaces
 * StripSpaceWithinControlStructures Strip empty lines within control structures.
 * TightConcat                       Ensure string concatenation does not have spaces, except when close to numbers.
 * UpgradeToPreg                     Upgrade ereg_* calls to preg_*
 * WordWrap                          Word wrap at 80 columns.
 * WrongConstructorName              Update old constructor names into new ones. http://php.net/manual/en/language.oop5.decon.php
 * YodaComparisons                   Execute Yoda Comparisons.

### What does it do?

<table>
<tr>
<td>Before</td>
<td>After</td>
</tr>
<tr>
<td>
<pre><code>&lt;?php
for($i = 0; $i &lt; 10; $i++)
{
if($i%2==0)
echo "Flipflop";
}
</code></pre>
</td>
<td>
<pre><code>&lt;?php
for ($i = 0; $i &lt; 10; $i++) {
	if ($i%2 == 0) {
		echo "Flipflop";
	}
}
</code></pre>
</td>
</tr>
<tr>
<td>
<pre><code>&lt;?php
$a = 10;
$otherVar = 20;
$third = 30;
</code></pre>
</td>
<td>
<pre><code>&lt;?php
$a        = 10;
$otherVar = 20;
$third    = 30;
</code></pre>
<i>This can be enabled with the option "enable_auto_align"</i>
</td>
</tr>
<tr>
<td>
<pre><code>&lt;?php
namespace NS\Something;
use \OtherNS\C;
use \OtherNS\B;
use \OtherNS\A;
use \OtherNS\D;

$a = new A();
$b = new C();
$d = new D();
</code></pre>
</td>
<td>
<pre><code>&lt;?php
namespace NS\Something;

use \OtherNS\A;
use \OtherNS\C;
use \OtherNS\D;

$a = new A();
$b = new C();
$d = new D();
</code></pre>
<i>note how it sorts the use clauses, and removes unused ones</i>
</td>
</tr>
</table>

### What does it do? - PSR version

<table>
<tr>
<td>Before</td>
<td>After</td>
</tr>
<tr>
<td>
<pre><code>&lt;?php
for($i = 0; $i &lt; 10; $i++)
{
if($i%2==0)
echo "Flipflop";
}
</code></pre>
</td>
<td>
<pre><code>&lt;?php
for ($i = 0; $i &lt; 10; $i++) {
    if ($i%2 == 0) {
        echo "Flipflop";
    }
}
</code></pre>
<i>Note the identation of 4 spaces.</i>
</td>
</tr>
<tr>
<td>
<pre><code>&lt;?php
class A {
function a(){
return 10;
}
}
</code></pre>
</td>
<td>
<pre><code>&lt;?php
class A
{
    public function a()
    {
        return 10;
    }
}
</code></pre>
<i>Note the braces position, and the visibility adjustment in the method a().</i>
</td>
</tr>
<tr>
<td>
<pre><code>&lt;?php
namespace NS\Something;
use \OtherNS\C;
use \OtherNS\B;
use \OtherNS\A;
use \OtherNS\D;

$a = new A();
$b = new C();
$d = new D();
</code></pre>
</td>
<td>
<pre><code>&lt;?php
namespace NS\Something;

use \OtherNS\A;
use \OtherNS\C;
use \OtherNS\D;

$a = new A();
$b = new C();
$d = new D();
</code></pre>
<i>note how it sorts the use clauses, and removes unused ones</i>
</td>
</tr>
</table>

### Troubleshooting
- Be sure you can run PHP from the command line.
- If you are a MAMP user, please use the MAMP's PHP binary to execute the plugin. This issue might be handy to help you configure the plugin: https://github.com/dericofilho/sublime-phpfmt/issues/109

### Acknowledgements
- GoSublime - for the method to update the formatted buffer
- Google's diff match patch - http://code.google.com/p/google-diff-match-patch/
