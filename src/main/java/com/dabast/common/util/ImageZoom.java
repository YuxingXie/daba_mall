package com.dabast.common.util;

import com.sun.net.ssl.HttpsURLConnection;
import sun.net.www.protocol.http.HttpURLConnection;

import javax.imageio.ImageIO;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Iterator;

/**
 * Created by Administrator on 2015/12/26.
 */
public class ImageZoom {
    public void replaceImageColor(String file, Color srcColor, Color targetColor) throws IOException {
        URL http;
        if(file.trim().startsWith("https")){
            http = new URL(file);
            HttpsURLConnection conn = (HttpsURLConnection) http.openConnection();
            conn.setRequestMethod("GET");
        }else if(file.trim().startsWith("http")){
            http = new URL(file);
            HttpURLConnection conn = (HttpURLConnection) http.openConnection();
            conn.setRequestMethod("GET");
        }else{
            http = new File(file).toURI().toURL();
        }
        BufferedImage bi = ImageIO.read(http.openStream());

        for (int i = 0; i < bi.getWidth(); i++) {
            for (int j = 0; j < bi.getHeight(); j++) {
                System.out.println(bi.getRGB(i, j));
                if(srcColor.getRGB()==bi.getRGB(i, j)){
                    System.out.println(i+","+j+"  from:"+srcColor.getRGB()+"to"+targetColor.getRGB());
                    bi.setRGB(i, j, targetColor.getRGB());
                }
            }
        }
        Iterator<ImageWriter> it = ImageIO.getImageWritersByFormatName("png");
        ImageWriter writer = it.next();
        File f = new File("c://test02.png");
        ImageOutputStream ios = ImageIO.createImageOutputStream(f);
        writer.setOutput(ios);
        writer.write(bi);
        bi.flush();
        ios.flush();
        ios.close();
    }

    public void createImage(int width, int height,File f) throws IOException{
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_4BYTE_ABGR);
        Graphics2D graphic = bi.createGraphics();
        graphic.setColor(new Color(0.2f,0.3f,0.4f,0.4f));
        graphic.fillRect(0, 0, width, height);

        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                //result[i][j] = bi.getRGB(i, j) & 0xFFFFFF;
//                System.out.println(bi.getRGB(i, j));
                bi.setRGB(i, j, 0xFFFFFF);
            }
        }

        Iterator<ImageWriter> it = ImageIO.getImageWritersByFormatName("png");
        ImageWriter writer = it.next();

        ImageOutputStream ios = ImageIO.createImageOutputStream(new File("E:\\document\\somePic\\edit\\new.jpg"));
        writer.setOutput(ios);

        writer.write(bi);
    }
    public static void main(String[] args) throws IOException {
        new ImageZoom().createImage(350,350,new File("E:\\document\\somePic\\4e2a37fae6cd7b894ba27c8b0e2442a7d8330e9d.jpg"));
    }
}
