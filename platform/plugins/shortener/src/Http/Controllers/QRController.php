<?php

namespace Botble\Shortener\Http\Controllers;

use Botble\ACL\Models\User;
use Botble\Base\Events\BeforeUpdateContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\PageTitle;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Traits\HasDeleteManyItemsTrait;
use Botble\Shortener\Forms\PostForm;
use Botble\Shortener\Http\Requests\PostRequest;
use Botble\Shortener\Models\Shortener;
use Botble\Shortener\Repositories\Interfaces\ShortenerInterface;
use Botble\Shortener\Services\StoreCategoryService;
use Botble\Shortener\Services\StoreTagService;
// use Botble\Shortener\Tables\PostTable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Botble\Shortener\Help\Helper;
use Illuminate\Support\Facades\Log;
// use Endroid\QrCode\QrCode;
use Endroid\QrCode\Color\Color;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\Label\Label;
use Endroid\QrCode\Logo\Logo;
use Endroid\QrCode\RoundBlockSizeMode;
use Endroid\QrCode\Writer\PngWriter;
use Endroid\QrCode\Writer\ValidationException;

class QRController extends BaseController
{
    public function generateQRCode(Request $request)
    {
        // Retrieve the encoded URL from the query parameters
        $encodedUrl = $request->query('link');

        // Decode the URL
        $link = urldecode($encodedUrl);
        // dd($link);
        $writer = new PngWriter();
        $qrCode = new QrCode($link);

        // You can customize the QR code appearance if needed
        // For example:
        // $qrCode->setSize(300);
        // Create QR code
        $qrCode = QrCode::create($link)//'www.thejat.in')
        ->setEncoding(new Encoding('UTF-8'))
        ->setErrorCorrectionLevel(ErrorCorrectionLevel::Low)
        ->setSize(300)
        ->setMargin(10)
        ->setRoundBlockSizeMode(RoundBlockSizeMode::Margin)
        ->setForegroundColor(new Color(0, 0, 0))
        ->setBackgroundColor(new Color(255, 255, 255));

        // Create generic logo
        // $logo = Logo::create(__DIR__.'\symfony.png')
        //     ->setResizeToWidth(50)
        //     ->setPunchoutBackground(true)
        // ;

        // Create generic label
        $label = Label::create('Label')
        ->setTextColor(new Color(255, 0, 0));

        $imgName = "QRi.PNG";
        $result = $writer->write($qrCode)
        ->saveToFile("storage/qri.PNG");

        // Return the image name and path as a response
        return response()->json([
            'image_name' => $imgName,
            // 'image_path' => $imagePath,
        ]);


        // $result = $writer->write($qrCode); //, $logo, $label);
        // ->saveToFile("storage/QR1.PNG");
        // dd($result->getDataUri());
        // echo "<img src='{$result->getDataUri()}'>";


        // $dataUri = $result->getDataUri();
        // $elm =  "<img src='{$result->getDataUri()}'>";

        // echo $result->getString();
        // return $dataUri;
        // return response($image)
        //     ->header('Content-Type', $qrCode->getContentType());

        // return response($qrCode->writeString(), 200, ['Content-Type' => $qrCode->getContentType()]);

        // Return Data URI as a response
        // return response($elm);
        // return response($dataUri)->header('Content-Type', $result->getMimeType());
    }
}
